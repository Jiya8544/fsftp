<img src="img/logo.png" alt="FsFTP Server" title="FsFTP Server" align="right">
<h1>FsFTP Server (Fast and Secure FTP Server)</h1>

> <b>FR</b> - <font color="red">Pour compiler l'installateur automatique</font><br>
> <b>EN</b> - <font color="red">To compile the auto-installer</font><br>

> LINUX
```
set GOOS=linux
```

> FreeBSD
```
set GOOS=freebsd
```

> <b>FR</b> - <font color="red">Puis</font><br>
> <b>EN</b> - <font color="red">Then</font><br>

```
set GOOS=freebsd
set GOARCH=386
cd linuxInstaller
go build -o=install
```
