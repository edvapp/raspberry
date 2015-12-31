#!/bin/bash

file="/etc/hdparm.conf"

# 12 <=> 1 min
# 120 <=> 10 min
# 240 <=> 20 min
# Values from 241 to 251 specify from 1 to 11 units of 30 minutes, 
# yielding timeouts from 30 minutes to 5.5
SPIN_DOWN_TIME=240

function saveOriginal()
{
	cp $1 $1.history.$(date +%Y%m%d-%N )
	if ! [ -f $1.original ];
	then
		cp $1 $1.original
	fi
}


if  ! grep '# add spindown_time for sda' $file;
	then
		saveOriginal $file
		echo "# add spindown_time for sda"
		echo "/dev/sda {" >> $file
		echo "    write_cache = on" >> $file
		echo "    spindown_time = $SPIN_DOWN_TIME" >> $file
		echo "}" >> $file
	fi
