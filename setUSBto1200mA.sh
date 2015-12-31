#!/bin/bash

file="/boot/config.txt"

function saveOriginal()
{
	cp $1 $1.history.$(date +%Y%m%d-%N )
	if ! [ -f $1.original ];
	then
		cp $1 $1.original
	fi
}


if  ! grep 'max_usb_current=1' $file;
	then
		saveOriginal $file
		echo "max_usb_current=1" >> $file
	fi
