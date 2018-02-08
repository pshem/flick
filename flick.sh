#! /bin/bash

#Copyright @pshem & @ZsanettM 2017-2018, LGPL-3.0

#strict mode
set -euo pipefail

#Check if an argument has been passed to the script
case $# in #depending on the number of arguments
0) deviceName=Touchscreen;;
1) deviceName=$1;;
*) echo "Invalid number of arguments. Flick expects up to 1 device name. If your device name contains a space, quote it"
	exit 2;;
esac

#What is the number of the device?
deviceNumber=$(xinput | grep -i "$deviceName" | awk 'BEGIN { FS = "=" } ; { print $2 }' | awk '{ print $1 }') || (echo "Invalid device"; exit 3)

#Check device status
if [[ $(xinput list-props "$deviceNumber" |  grep -i 'Device Enabled' |  awk '{print $4}') -eq 1 ]]
#if enabled, disable
then
	xinput disable "$deviceNumber"
	echo "$deviceName turned off!"
#if disabled, enable
else
	xinput enable "$deviceNumber"
	echo "$deviceName turned on!"
fi
exit
