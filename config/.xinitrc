#!/bin/bash
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus	
ibus-daemon -x -d
export BROWSER=firefox-aurora
export DE=xfce
numlockx &
emacs --daemon &
sudo ntpdate pool.ntp.org &
exec ck-launch-session dbus-launch openbox-session
#~/builds/stumpwm/stumpwm
#


