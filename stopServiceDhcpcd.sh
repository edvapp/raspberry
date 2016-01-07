#!/bin/bash

function saveOriginal()
{
	cp $1 $1.history.$(date +%Y%m%d-%N )
	if ! [ -f $1.original ];
	then
		cp $1 $1.original
	fi
}

file=/etc/dhcpcd.conf

#saveOriginal $file

#echo "
#denyinterfaces eth0
#" >> $file

# stop and disable service
systemctl stop dhcpcd.service 
systemctl disable dhcpcd.service 