#!/bin/bash

$FORGEINSTALLERJARNAME="forge-installer.jar"
$RAMSIZE="5GB"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if ! [[ which java > /dev/null 2>&1; ]] then
    apt-get update
    apt-get upgrade -y
    apt-get install default-jdk -y
fi

if [ ! -f run.sh ]
    wget -O $FORGEINSTALLER 
    java -jar $FORGEINSTALLER --installServer
    echo "-Xmx$RAMSIZE" > user_jvm_args.txt
    chmod 755 run.sh
fi

/bin/bash run.sh