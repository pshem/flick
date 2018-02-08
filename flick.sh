#! /bin/bash

#strict mode
set -euo pipefail

#Check if an argument has been passed to the script
if [ $# -eq 1 ];
then
	deviceName=$1
elif [ $# -eq 0 ]; #with no argumnets, default to Touchscreen
then
	deviceName=Touchscreen
else
	echo "Invalid number of arguments. Flick expects up to 1 device name. If your device name contains a space, quote it"
	exit 1;
fi
echo $deviceName

#What is the number of the device?
deviceNumber=$(xinput | grep -i "$deviceName" | awk 'BEGIN { FS = "=" } ; { print $2 }' | awk '{ print $1 }')

#Check device status
if [[ $(xinput list-props "$deviceNumber" |  grep -i 'Device Enabled' |  awk '{print $4}') == '1' ]]
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
