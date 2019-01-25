#!/bin/bash

if [[ $# != 2 ]]; then

echo "Please call '$0 argument1 argument2' to run this command!"
exit 1

fi

cmd="$(tr [A-Z] [a-z] <<< "$1")"
server="$(tr [a-z] [A-Z] <<< "$2")"


if [ $UID != 0 ]; then

echo "EN - You do not have sufficient privileges to run this script, please use sudo $0 or log in as root"
echo
echo "FR - Vous n'avez pas les privilèges suffisants pour exécuter ce script. Veuillez utiliser sudo $0 ou connectez vous en tant que root"

exit 1
fi



case $cmd in

			start)
	
	if [[ "${server}" == "FTP" || "${server}" == "FTPS" ]]; then
	
	echo "$server Server started succefull...";
	cd /opt/fsftp
	/opt/fsftp/ftpserver & exit 0

	elif [[ "${server}" == "HTTP" || "${server}" == "HTTPS" ]]; then

	echo "$server Server started succefull...";
	cd /opt/fsftp
	/opt/fsftp/webserver & exit 0

	elif [[ "${server}" == "ALL" || "${server}" == "SERVICE" ]]; then

	echo "All Server (FTP & HTTP) started succefull...";
	cd /opt/fsftp
	/opt/fsftp/ftpserver & /opt/fsftp/webserver & exit 0
	
	else

	echo "Server not found! Please enter $0 $cmd ftp or $0 $cmd http or $0 $cmd all"
	exit 1

	fi
  ;;  
  
			kill) 
			
	if [[ "${server}" == "FTP" || "${server}" == "FTPS" ]]; then
	
	cd /opt/fsftp
	/opt/fsftp/killserver ftp
	exit 0

	elif [[ "${server}" == "HTTP" || "${server}" == "HTTPS" ]]; then

	cd /opt/fsftp
	/opt/fsftp/killserver http
	exit 0

	elif [[ "${server}" == "ALL" || "${server}" == "SERVICE" ]]; then

	cd /opt/fsftp
	/opt/fsftp/killserver all
	exit 0
	
	else

	echo "Server not found! Please enter $0 $cmd ftp or $0 $cmd http or $0 $cmd all"
	exit 1

	fi
  ;;
  
 
  *) echo "Argument not found! Please enter start ou kill"

esac

