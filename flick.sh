#! /bin/bash

#strict mode
set -euo pipefail

# How is the touchscreen called?
touchscreenName=Touchscreen

touchscreenNumber=$(xinput | grep -i "$touchscreenName" | awk '{print $5}' | cut -d= -f2)

#check status
if [[ $(xinput list-props "$touchscreenNumber" |  grep -i 'Device Enabled' |  awk '{print $4}') == '1' ]]
#if enabled, disable
then
	xinput disable "$touchscreenNumber"
	echo "Touchscreen turned off!"
#if disabled, enable
else
	xinput enable "$touchscreenNumber"
	echo "Touchscreen turned on!"
fi
exit
