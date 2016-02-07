#!/bin/bash

function saveOriginal()
{
	cp $1 $1.history.$(date +%Y%m%d-%N )
	if ! [ -f $1.original ];
	then
		cp $1 $1.original
	fi
}

file=/etc/bind/named.conf.options

saveOriginal $file

sed -e "{
	s/dnssec-validation auto/\/\/dnssec-validation auto/
}" -i $file
