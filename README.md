# flick
CLI touchscreen switcher for GNU/Linux. Works only with X11, no Wayland or Mir compatiblity

To use:
1. download,
2. move to your preferred directory,
3. chmod +x flick.sh

If it doesn't work, run line 9 from xinput onwards:
~$ xinput | grep -i "$touchscreenName" | awk '{print $5}' | cut -d= -f2
and check what the output is. If it's not a number analyze the output of:
~$ xinput list

The most probable cause of your problems is a 3 element touchscreen name. To fix it, simply change 5 to 6 inside
awk '{print $5}'

Another probable cause of failure is having a touchscreen whose name doesn't include the word touchscreen. To fix it, check how your touch device is called. You can then change line 7 behind the '=' sign(make sure to leave no spaces in between or variable assignment will fail) to your touchscreen's name.

Yet another reason for the program's failure is running a display server other than X.org. If you are using Fedora 25 or Ubuntu 16.10 in the Unity8 desktop, this is the case.

The reason this program was created is the inability to create hard referals to devices in xinput. You can only reference devices by their number, and these numbers are not constant(they depend on the order of driver loading). Hence booting with a mouse plugged in will result in different device numbers than booting without one.
