package main

import (
	"archive/zip"
	"fmt"
	"fsftp/common"
	"fsftp/ftpServer/owner"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

func main() {

	// Check Admin privileges
	ok, err := owner.Privileges()
	if !ok {
		fmt.Println(err)
		return
	}

	if err := owner.Header(false); err != nil {
		fmt.Println(err)
		//!\ Recommended. Continue script execution even if an error occurred while checking User/Group
		// return
	}

	// Download software
	url := fmt.Sprintf("http://-.fr/%s/fsftp.zip", owner.Arch())
	err = Download(url)
	if err != nil {
		fmt.Println(err)
		return
	}
	// Unzip
	_, err = Unzip("fsftp.zip", "")
	if err != nil {
		fmt.Println(err)
		return
	}
	os.Remove("fsftp.zip")
	// fmt.Println("Unzipped:\r\n" + strings.Join(files, "\r\n"))

	dir := common.ServerDir() + "/fsftp"
	cmd := exec.Command("chown", "-R", "fsftp:ftpgroup", dir)
	if err := cmd.Run(); err != nil {
		fmt.Printf("Can not apply a chown to the %s Directory! Please do it manually. Error: %s\r\n", dir, err)
	}

	// We apply maximum security on folders and files
	exec.Command("chmod", "-R", "0600", dir).Run()
	exec.Command("chmod", "0700", dir).Run()

	if err := exec.Command("chmod", "0500", dir+"/service").Run(); err != nil {
		fmt.Printf("Can not apply a chmod 500 to the %s/service file! Please do it manually. Error: %s\r\n", dir, err)
	}
	if err := exec.Command("chmod", "0500", dir+"/ftpserver").Run(); err != nil {
		fmt.Printf("Can not apply a chmod 500 to the %s/ftpserver file! Please do it manually. Error: %s\r\n", dir, err)
	}
	if err := exec.Command("chmod", "0500", dir+"/webserver").Run(); err != nil {
		fmt.Printf("Can not apply a chmod 500 to the %s/webserver file! Please do it manually. Error: %s\r\n", dir, err)
	}

	exec.Command("iptables", "-A", "INPUT", "-p", "tcp", "-i", "eth0", "--dport", "21", "-j", "ACCEPT").Run()
	exec.Command("iptables", "-A", "INPUT", "-p", "tcp", "-i", "eth0", "--dport", "990", "-j", "ACCEPT").Run()
	exec.Command("iptables", "-A", "INPUT", "-p", "tcp", "-i", "eth0", "--dport", "3000", "-j", "ACCEPT").Run()
	exec.Command("iptables", "-A", "INPUT", "-p", "tcp", "-i", "eth0", "--destination-port", "4000:4100", "-j", "ACCEPT").Run()
	host := "127.0.0.1"
	if serverIp, err := common.ExternalIP(); err == nil {
		host = serverIp
	}

	str := "\r\n\r\n* * * * * *  * * FR - Félicitation ! * * * * * * * *\r\n"
	str += "Pour administrer votre serveur, allez à l'adresse https://IP-DE-VOTRE-SERVER:3000 "
	str += "( ex: https://" + host + ":3000 )\r\n\r\n"
	str += "- Pseudo       : admin\r\n"
	str += "- Mot de passe : admin\r\n"

	str += "\r\n\r\n* * * * * * * * EN - Congratulations! * * * * * * * *\r\n"
	str += "To administer your server, go to https://YOUR-IP-SERVER:3000 "
	str += "( eg: https://" + host + ":3000 )\r\n\r\n"
	str += "- Login    : admin\r\n"
	str += "- Password : admin\r\n"

	fmt.Println(str)

	// Remove current Installation file
	path, _ := os.Executable()
	if _, err := os.Stat(path); !os.IsNotExist(err) {
		file := filepath.Base(path)
		os.Remove(file)
	}

	// Starting servers (FTP & HTTP)
	exec.Command(dir+"/service", "start", "all").Start()

	/*	exec.Command(dir+"/service", "start", "http").Start()
		exec.Command(dir+"/service", "start", "ftp").Start()
	*/
}

// Download software
func Download(url string) error {
	tokens := strings.Split(url, "/")
	fileName := tokens[len(tokens)-1]
	// fmt.Println("Downloading", url, "to", fileName)

	output, err := os.Create(fileName)
	if err != nil {
		return fmt.Errorf("Error while creating", fileName, "-", err)
	}
	defer output.Close()

	response, err := http.Get(url)
	if err != nil {
		return fmt.Errorf("Error while downloading", url, "-", err)
	}
	defer response.Body.Close()

	// Check server response
	if response.StatusCode != http.StatusOK {
		return fmt.Errorf("bad status: %s", response.Status)
	}

	_, err = io.Copy(output, response.Body)
	if err != nil {
		return fmt.Errorf("Error while downloading", url, "-", err)
	}

	// fmt.Println(n, "bytes downloaded.")
	return nil
}

// Unzip will decompress a zip archive, moving all files and folders
// within the zip file (parameter 1) to an output directory (parameter 2).
func Unzip(src, dest string) ([]string, error) {

	var filenames []string

	r, err := zip.OpenReader(src)
	if err != nil {
		return filenames, err
	}
	defer r.Close()

	for _, f := range r.File {

		rc, err := f.Open()
		if err != nil {
			return filenames, err
		}
		defer rc.Close()

		// Store filename/path for returning and using later on
		fpath := filepath.Join(dest, f.Name)

		filenames = append(filenames, fpath)

		if f.FileInfo().IsDir() {
			// Make Folder
			os.MkdirAll(fpath, os.ModePerm)

		} else {

			// Make File
			if err = os.MkdirAll(filepath.Dir(fpath), os.ModePerm); err != nil {
				return filenames, err
			}

			outFile, err := os.OpenFile(fpath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, f.Mode())
			if err != nil {
				return filenames, err
			}

			_, err = io.Copy(outFile, rc)

			// Close the file without defer to close before next iteration of loop
			outFile.Close()

			if err != nil {
				return filenames, err
			}

		}
	}
	return filenames, nil
}
