<i>Ce fichier existe en plusieurs langues. <a href="AIDE.md"><u>Cliquez ici pour le lire en Français</i></a></i>

<hr>

To administer your server, go to https://IP-DE-YOUR-SERVER:3000<br>
Example: https://127.0.0.1:3000<br><br>
```
Login    : admin
Password : admin
```

To start, stop or restart the servers, open the console ( command line ) and go to the directory where you installed the software. Default <b>C:\\fsftp</b> on Windows and <b>/opt/fsftp</b> on other operating systems:<br>

#### Under windows
```
cd C:\\fsftp
```

#### Under Linux etc...
```
cd /opt/fsftp
```

#### To start all servers (HTTPS and FTP) type:
```
./service start all
```

#### To stop all servers (HTTPS and FTP) type:
```
./service stop all
```

#### To restart all servers (HTTPS and FTP) type:
```
./service restart all
```

#### To start the web server type:
```
./service start http
```

#### To stop the web server type:
```
./service stop http
```

#### To restart the web server type:
```
./service restart http
```

#### To start the FTP server type:
```
./service start ftp
```

#### To stop the FTP server type:
```
./service stop ftp
```

#### To restart the FTP server type:
```
./service restart ftp
```
