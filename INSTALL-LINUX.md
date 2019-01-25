<h2>
<b>FR</b> - Installation sous Linux<br>
<b>US</b> - Linux installation:
</h2>

> <b>FR</b> - <font color="red">Il convient de modifier <u>apt-get</u> selon votre syst&egrave;me d\'exploitation</font><br>
> <b>EN</b> - <font color="red">You should change <u>apt-get</u> according to your Operating System</font>

```
Arch Linux          : pacman
Red Hat / Fedora    : yum
Debian / Ubuntu     : apt-get
SLES / openSUSE     : zypper
Gentoo              : emerge
```


> <b>FR</b> - Installation des paquets n&eacute;cessaires<br>
> <b>EN</b> - Installation of the necessary packages
```
sudo apt-get update & apt-get install -y wget unzip
```
> <b>FR</b> - On se place dans le r&eacute;pertoire <b>opt</b><br>
> <b>EN</b> - We go to the opt directory
```
cd /opt
```
> <b>FR</b> - On t&eacute;l&eacute;charge le logiciel<br>
> <b>EN</b> - Download the software
```
sudo wget http://-.fr/fsftp/linux/fsftp.zip
```
> <b>FR</b> - D&eacute;compresser puis supprimer le fichier ZIP<br>
> <b>EN</b> - Unzip then deleting the ZIP file
```
sudo unzip fsftp.zip
sudo rm -f fsftp.zip
```
> <b>FR</b> - On se place dans le r&eacute;pertoire du logiciel<br>
> <b>EN</b> - We go to the software directory
```
cd fsftp
```
> <b>FR</b> - On rend certains fichiers ex&eacute;cutables<br>
> <b>EN</b> - We make some executable files
```
sudo chmod +x ftpserver
sudo chmod +x webserver
sudo chmod +x killserver
sudo chmod +x fsftp.sh
```
> <b>FR</b> - Autoriser les connexions au port 21, 990 et 3000 et activer le mode Passive<br>
> <b>EN</b> - Allow connections to port 21, 990 and 3000 and enable Passive mode

```
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 21 -j ACCEPT
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 990 -j ACCEPT
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 3000 -j ACCEPT
sudo iptables -I INPUT -p tcp --destination-port 1024:65535 -j ACCEPT
```
> <b>FR</b> - D&eacute;marrage des serveurs (FTP & HTTP)<br>
> <b>EN</b> - Starting servers (FTP & HTTP)
```
sudo ./fsftp.sh start all
```
> <b>FR</b> - F&eacute;licitation !<br>
Pour administrer votre serveur, allez à l'adresse https://ADRESSE-DE-VOTRE-SERVER:3000<br>
<b>Nb :</b> changez ADRESSE-DE-VOTRE-SERVER par l\'adresse IP de votre machine ex: https://127.0.0.1:3000<br>
Merci de votre int&eacute;rêt<br>

> <b>EN</b> - Congratulations !<br>
To administer your server, go to https://ADDRESS-OF-YOUR-SERVER: 3000<br>
<b>Nb:</b> change ADDRESS-OF-YOUR-SERVER by the IP address of your machine ex: https://127.0.0.1:3000<br>
Thanks for your interest

