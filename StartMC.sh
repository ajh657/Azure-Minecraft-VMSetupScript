#!/bin/bash

$MCJARPATH="minecraft_server.jar"
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

java -Xmx$RAMSIZE -jar $MCJARPATH --nogui