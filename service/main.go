package main

import (
	"fmt"
	"fsftp/common"
	"fsftp/common/pid"
	"fsftp/ftpServer/owner"
	"os"
	"strings"
)

func main() {

	// Check Admin privileges
	ok, err := owner.Privileges()
	if !ok {
		fmt.Println(err)
		return
	}

	pidDir := common.DetectDataDir() + "pid/"
	pid.SetPidDir(pidDir)

	what := "all"
	cmd := "start"

	if len(os.Args) == 3 {
		cmd = os.Args[1]
		what = os.Args[2]
	}
	what = strings.ToLower(what)
	cmd = strings.ToLower(cmd)

	if what == "ftp" {

		if cmd == "start" || cmd == "restart" {

			// Kill current server if started
			pid.KillProcessFTP()
			if err := owner.StartFtp(); err != nil {
				fmt.Println(err)
				return
			}

			if cmd == "start" {
				fmt.Println("FTP Server Started successfull.")
			} else {
				fmt.Println("FTP Server Restarted successfull.")
			}
			return

		} else if cmd == "stop" {

			pid.KillProcessFTP()
			fmt.Println("FTP Server Stopped successfull.")
			return
		}

		Usage()
		return
	}

	if what == "http" {

		if cmd == "start" || cmd == "restart" {

			// Kill current server if started
			pid.KillProcessHTTP()
			if err := owner.StartHttp(); err != nil {
				fmt.Println(err)
				return
			}

			if cmd == "start" {
				fmt.Println("HTTPS Server Started successfull.")
			} else {
				fmt.Println("HTTPS Server Restarted successfull.")
			}
			return
		} else if cmd == "stop" {

			pid.KillProcessHTTP()
			fmt.Println("HTTPS Server Stopped successfull.")
			return
		}

		Usage()
		return
	}

	if what == "all" {

		if cmd == "start" || cmd == "restart" {

			// Kill current servers if started
			pid.KillProcessFTP()
			pid.KillProcessHTTP()

			if err := owner.StartFtp(); err != nil {
				fmt.Println(err)
				return
			}

			if err := owner.StartHttp(); err != nil {
				fmt.Println(err)
				return
			}

			if cmd == "start" {
				fmt.Println("Servers Started successfull.")
			} else {
				fmt.Println("Servers Restarted successfull.")
			}
			return
		} else if cmd == "stop" {

			pid.KillProcessFTP()
			pid.KillProcessHTTP()
			fmt.Println("Servers Stopped successfull.")
			return
		}

		Usage()
		return
	}

	Usage()

}

func Usage() {
	path := os.Args[0]
	str := "\r\n\r\n"
	str += "* Usage: " + path + " [ start XXX | stop XXX | restart XXX ] while XXX = ftp or http or all.\r\n"
	str += "\r\n"
	str += "Eg: to start the ftp server put: " + path + " start ftp\r\n"
	str += "\r\n"
	str += path + " start all\t\tto start All servers ( HTTPS & FTP )\r\n"
	str += path + " stop all\t\tto stop/kill All servers ( HTTPS & FTP )\r\n"
	str += path + " restart all\t\tto restart All servers ( HTTPS & FTP )\r\n"
	str += "\r\n"
	str += path + " start ftp\t\tto start FTP server\r\n"
	str += path + " stop ftp\t\tto stop/kill FTP server\r\n"
	str += path + " restart ftp\t\tto restart FTP server\r\n"
	str += "\r\n"
	str += path + " start http\t\tto start HTTP server\r\n"
	str += path + " stop http\t\tto stop/kill HTTP server\r\n"
	str += path + " restart http\t\tto restart HTTP server\r\n"

	fmt.Println(str)
}
