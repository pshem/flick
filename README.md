flick
=======

[![license](https://img.shields.io/badge/license-LGPLv3-brightgreen.svg)](/LICENSE)

CLI input device switcher for GNU/Linux. Works only with X11, no Wayland or Mir compatiblity

## Goal
Hacking around the inability to create hard referals to devices in xinput. You can only reference devices by their number, and these numbers depend on the order of drivers loading. Hence booting with a mouse plugged in will result in different device numbers than booting without one. 

Flick takes the current number from `xinput list` and passes it by value. Automatically choosing `disable` or `enable` based on the current state is a bonus.

## How to use
To use:
1. Go the the folder where you want to save the script
2. Download the script 
``` 
~$ curl https://raw.githubusercontent.com/pshem/flick/master/flick.sh > flick.sh
```
3. Run the script ``` ~$ bash flick.sh ```
4. Or run the script against a different device 
``` ~$ bash flick.sh Touchpad ```

## Troubleshooting
If it doesn't work, run line 16 from xinput onwards:
```
~$ xinput | grep -i "$deviceName" | awk 'BEGIN { FS = "=" } ; { print $2 }' | awk '{ print $1 }'
```
If the output is not a single number, analyze the output of:
```
~$ xinput list
```
The most probable cause of failure is a touchscreen, whose name doesn't include the word "touchscreen". To fix it, check how your touch device is called and change line 7 behind the '=' sign to your touchscreen's name. Make sure to leave no spaces in between or variable assignment will fail.

Yet another reason for the program's failure is running a display server other than X.org. If you are using Fedora 25+, Ubuntu 17.10+, or Ubuntu 16.10 with the Unity 8 desktop, this is the case.

The program will probably also fail upon encountering multiple touchscreens.

## License
This code is distributed under the terms of the LGPL, version 3 or higher. For more info, read the
[LICENSE][license] file distributed with the source code.

[license]: /LICENSE.MD
