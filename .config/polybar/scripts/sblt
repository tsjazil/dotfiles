#!/bin/sh

bluetoothctl info >> /tmp/sbltlog

if [ "$?" == 0 ]
then
	status=$(bluetoothctl info | awk '$1 == "Connected:"{print $0}' |sed 's/Connected: //g' |  sed  's/^[ \t]*//' )
	stta=$(echo $status | sed  's/^[ \t]*//')
	stt=$(echo $stta)
	if [ "$stt" == "yes" ]
	then
 		echo ""
	fi
else
	echo ""
fi
