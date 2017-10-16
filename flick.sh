#! /bin/bash

#strict mode
set -euo pipefail

#Check if an argument has been passed to the script
if [ -n "${1:+1}" ];
then
	deviceName=$1
else	#otherwise, default to Touchscreen
	deviceName=Touchscreen
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
