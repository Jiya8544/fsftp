#!/bin/bash


# Exécuter le script en tant qu'administrateur
# Run Script with Admin mode

if [ $UID != 0 ]; then
echo "EN - You do not have sufficient privileges to run this script, please use sudo $0 or log in as root"
echo
echo "FR - Vous n'avez pas les privilèges suffisants pour exécuter ce script. Veuillez utiliser sudo $0 ou connectez vous en tant que root"
exit 1
fi

# FR - Installation des paquets nécessaires
# EN - Installation of the necessary packages
unzip=`which unzip`
wget=`which wget`
cmd=""

if [[ "${unzip}" == "" ]]; then
cmd=" unzip"
fi

if [[ "${wget}" == "" ]]; then
cmd+=" wget"
fi

if [[ "${cmd}" != "" ]]; then
sudo apt-get update && apt-get -y install$cmd
fi


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
sudo chmod +x bin/ftpserver
sudo chmod +x bin/webserver
sudo chmod +x fsftp-ctrl


# FR - Création d'un identifiant et d'un groupe pour le serveur
# EN - Create an identifier and a group for the server
sudo groupadd ftpgroup
sudo useradd fsftp -g ftpgroup -d /dev/null
sudo chown fsftp:ftpgroup -R /opt/fsftp


# FR - Autoriser les connexions au port 21, 990 et 3000 et activer le mode Passive
# EN - Allow connections to port 21, 990 and 3000 and enable Passive mode

sudo iptables -I INPUT 1 -m tcp -p tcp --dport 21 -j ACCEPT
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 990 -j ACCEPT
sudo iptables -I INPUT 1 -m tcp -p tcp --dport 3000 -j ACCEPT
sudo iptables -I INPUT -p tcp --destination-port 1024:65535 -j ACCEPT

# FR - Autoriser les ports pour les serveurs (< 1024)
# EN - Allow ports for servers ( < 1024 )
setcap 'cap_net_bind_service=+ep' /opt/fsftp/bin/ftpserver
setcap 'cap_net_bind_service=+ep' /opt/fsftp/bin/webserver


# FR - Démarrage des serveurs (FTP & HTTP)
# EN - Starting servers (FTP & HHTP)
sudo ./fsftp-ctrl start ftpserver
sudo ./fsftp-ctrl start webserver

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
