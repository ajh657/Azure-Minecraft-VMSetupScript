#!/bin/bash

$MCJARNAME="minecraft_server.jar"
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

if [ ! -f $MCJARNAME ]
    wget -O $MCJARNAME https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar
fi

java -Xmx$RAMSIZE -jar $MCJARNAME --nogui