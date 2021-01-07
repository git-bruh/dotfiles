#!/bin/sh -e

. "$(dirname "$0")/flags.sh"

bwrap \
    $DEFFLAGS \
    --ro-bind /usr/lib/firefox /usr/lib/firefox \
    --symlink /usr/lib/firefox/firefox /usr/bin/firefox \
    --ro-bind /usr/share/glvnd /usr/share/glvnd \
    --ro-bind /usr/share/libdrm /usr/share/libdrm \
    --ro-bind /usr/share/X11/xkb /usr/share/X11/xkb \
    --ro-bind /usr/share/glib-2.0 /usr/share/glib-2.0 \
    --ro-bind /sys/dev/char /sys/dev/char \
    --ro-bind /sys/devices/pci0000:00 /sys/devices/pci0000:00 \
    --bind "$HOME/.mozilla" "$HOME/.mozilla" \
    --bind "$HOME/Downloads/firefox" "$HOME/Downloads" \
    /usr/bin/firefox
