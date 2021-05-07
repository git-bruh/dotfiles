#!/bin/sh

DEFFLAGS="
	--ro-bind /etc/asound.conf /etc/asound.conf
	--ro-bind /etc/fonts /etc/fonts
	--ro-bind /etc/resolv.conf /etc/resolv.conf
	--ro-bind /etc/ssl /etc/ssl
	--ro-bind /usr /usr
	--symlink usr/bin /bin
	--symlink usr/bin /sbin
	--symlink usr/lib /lib
	--symlink usr/lib /lib64
	--ro-bind-try $HOME/.config/gtk-3.0 $HOME/.config/gtk-3.0
	--dev /dev
	--dev-bind /dev/snd /dev/snd
	--dev-bind /dev/nvidia-modeset /dev/nvidia-modeset
	--dev-bind /dev/nvidia0 /dev/nvidia0
	--dev-bind /dev/nvidiactl /dev/nvidiactl
	--proc /proc
	--ro-bind /sys/dev/char /sys/dev/char
	--ro-bind /sys/devices/pci0000:00 /sys/devices/pci0000:00
	--tmpfs /tmp
	--bind /tmp/.X11-unix/X0 /tmp/.X11-unix/X0
	--unshare-all
	--share-net
	--hostname RESTRICTED
	--setenv DISPLAY ${DISPLAY:-:0}
	--setenv PATH /usr/bin
	--die-with-parent
	--new-session
"
