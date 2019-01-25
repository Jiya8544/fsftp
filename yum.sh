#!/bin/bash

# FR - Installation des paquets nécessaires
# EN - Installation of the necessary packages
sudo yum update & yum install -y wget unzip

# FR - On se place dans le répertoire opt
# EN - We go to the opt directory
cd /opt

# FR - On télécharge le logiciel
# EN - Download the software
sudo wget http://-.fr/fsftp/linux/fsftp.zip

# FR - Décompresser puis supprimer le fichier ZIP
# EN - Unzip then deleting the ZIP file
sudo unzip fsftp.zip
sudo rm -f fsftp.zip

# FR - On se place dans le répertoire du logiciel
# EN - We go to the software directory
cd fsftp

# FR - On rend certains fichiers exécutables
# EN - We make some executable files
sudo chmod +x ftpserver
sudo chmod +x webserver
sudo chmod +x killserver
sudo chmod +x fsftp.sh

# FR - Autoriser les connexions au port 21, 990 et 3000 et activer le mode Passive
# EN - Allow connections to port 21, 990 and 3000 and enable Passive mode

sudo iptables -I INPUT 1 -m tcp -p tcp --dport 21 -j ACCEPT
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 990 -j ACCEPT
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 3000 -j ACCEPT
sudo iptables -I INPUT -p tcp --destination-port 1024:65535 -j ACCEPT

# FR - Démarrage des serveurs (FTP & HTTP)
# EN - Starting servers (FTP & HHTP)
sudo ./fsftp.sh start all

echo "
FR - Félicitation !
Pour administrer votre serveur, allez à l'adresse https://ADRESSE-DE-VOTRE-SERVER:3000
Nb: changez ADRESSE-DE-VOTRE-SERVER par l'adresse IP de votre machine ex: https://127.0.0.1:3000
Merci de votre intérêt

EN - Congratulations !
To administer your server, go to https://ADDRESS-OF-YOUR-SERVER: 3000
Nb: change ADDRESS-OF-YOUR-SERVER by the IP address of your machine ex: https://127.0.0.1:3000
Thanks for your interest
"
