<i>Ce fichier existe en plusieurs langues. <a href="AIDE.md"><u>Cliquez ici pour le lire en Français</i></a></i>

<hr>

To administer your server, go to https://IP-DE-YOUR-SERVER:3000<br>
<br>Example: https://127.0.0.1:3000<br><br>
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
fsftp start all
```

#### To stop all servers (HTTPS and FTP) type:
```
fsftp stop all
```

#### To restart all servers (HTTPS and FTP) type:
```
fsftp restart all
```

#### To start the web server type:
```
fsftp start webserver
```

#### To stop the web server type:
```
fsftp stop webserver
```

#### To restart the web server type:
```
fsftp restart webserver
```

#### To start the FTP server type:
```
fsftp start ftpserver
```

#### To stop the FTP server type:
```
fsftp stop ftpserver
```

#### To restart the FTP server type:
```
fsftp restart ftpserver
```
