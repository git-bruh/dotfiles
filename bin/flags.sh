#!/bin/sh

unset DBUS_SESSION_BUS_ADDRESS
unset DBUS_SESSION_BUS_PID

DBUS_WRAPPER_REAL="$(dirname "$0")/dbus-wrap"
DBUS_WRAPPER=/dbus-wrap

export DBUSFLAGS="
	--dir /run/dbus
	--ro-bind-try /etc/dbus-1 /etc/dbus-1
	--setenv XDG_CURRENT_DESKTOP sway
	--setenv XDG_SESSION_TYPE wayland
	--ro-bind $DBUS_WRAPPER_REAL $DBUS_WRAPPER
"

unset DBUS_WRAPPER_REAL

export DEFFLAGS="
	--ro-bind /etc/localtime /etc/localtime
	--ro-bind /etc/fonts /etc/fonts
	--ro-bind /etc/resolv.conf /etc/resolv.conf
	--ro-bind /etc/ssl /etc/ssl
	--ro-bind /usr /usr
	--symlink usr/bin /bin
	--symlink usr/bin /sbin
	--symlink usr/lib /lib
	--symlink usr/lib /lib64
	--ro-bind-try /usr/share/fonts /usr/share/fonts
	--ro-bind-try /usr/share/icons /usr/share/icons
	--ro-bind-try /usr/share/themes /usr/share/themes
	--ro-bind-try /etc/asound.conf /etc/asound.conf
	--ro-bind-try $HOME/.asoundrc $HOME/.asoundrc
	--ro-bind-try $HOME/.icons $HOME/.icons
	--ro-bind-try $HOME/.config/gtk-3.0 $HOME/.config/gtk-3.0
	--dev /dev
	--dev-bind /dev/snd /dev/snd
	--dev-bind /dev/dri /dev/dri
	--dev-bind-try /dev/nvidia-modeset /dev/nvidia-modeset
	--dev-bind-try /dev/nvidia0 /dev/nvidia0
	--dev-bind-try /dev/nvidiactl /dev/nvidiactl
	--dev-bind-try /dev/video0 /dev/video0
	--proc /proc
	--ro-bind /sys/dev/char /sys/dev/char
	--ro-bind /sys/devices/pci0000:00 /sys/devices/pci0000:00
	--tmpfs /tmp
	--bind-try $XDG_RUNTIME_DIR $XDG_RUNTIME_DIR
	--bind-try /tmp/.X11-unix /tmp/.X11-unix
	--unshare-all
	--share-net
	--hostname RESTRICTED
	--setenv PATH /usr/bin
	--setenv DISPLAY ${DISPLAY:-:0}
	--die-with-parent
	--new-session
"
