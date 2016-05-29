#!/bin/sh
while true
do
	aaa=0
	aaa=`cat /var/log/tinyproxy/tinyproxy.log | grep Interrupted | grep -v "grep"| wc -l |awk '{print $1}'`
	if [ $aaa -ne 0 ] 
	then
		rm -rf /var/log/tinyproxy/tinyproxy.log
		pkill tinyproxy
		service tinyproxy restart 
	else 
		echo "Tinyproxy Running OK!"
	fi
	sleep 120
done
