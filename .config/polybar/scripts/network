#!/bin/sh


if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null ; then
	wifiicon="$(awk '/^\s*w/ { print " 說", int($3 * 100 / 70)"%"}' /proc/net/wireless)"
elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null ; then
	grep -xq '0x1003' /sys/class/net/w*/flags && wifiicon="" || wifiicon= "ﲁ"
fi

echo "$wifiicon"
