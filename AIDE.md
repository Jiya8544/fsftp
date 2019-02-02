<i>This file exists in several languages. <a href="HELP.md"><u>Click here to read it in English</u></a></i>
<hr>
Pour administrer votre serveur, allez à l'adresse https://IP-DE-VOTRE-SERVER:3000<br>
Exemple : https://127.0.0.1:3000<br><br>

```
Votre Pseudo : admin
Mot de passe : admin
```
Pour démarrer, arrêter ou redémarrer les serveurs, ouvrez la console (ligne de commande) et placez-vous dans le répertoire où vous avez installé le logiciel. Par défaut <b>C:\\fsftp</b> sous Windows et <b>/opt/fsftp</b> sous les autres systèmes d'exploitation.<br>

#### Sous Windows
```
cd C:\\fsftp
```

#### Sous Linux etc...
```
cd /opt/fsftp
```

#### Pour démarrer tous les serveurs (HTTPS et FTP) tapez :
```
./service start all
```

#### Pour arrêter tous les serveurs (HTTPS et FTP) tapez :
```
./service stop all
```

#### Pour redémarrer tous les serveurs (HTTPS et FTP) tapez :
```
./service restart all
```

#### Pour démarrer le serveur web tapez :
```
./service start webserver
```

#### Pour arrêter le serveur web tapez :
```
./service stop webserver
```

#### Pour redémarrer le serveur web tapez :
```
./service restart webserver
```

#### Pour démarrer le serveur FTP tapez :
```
./service start ftpserver
```

#### Pour arrêter le serveur FTP tapez :
```
./service stop ftpserver
```

#### Pour redémarrer le serveur FTP tapez :
```
./service restart ftpserver
```

