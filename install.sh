#!/usr/bin/env sh

set -eu

cd "$(dirname "$0")"

LINKS="
.profile:.profile
fontconfig/fonts.conf:.config/fontconfig/fonts.conf
gtk-3.0/settings.ini:.config/gtk-3.0/settings.ini
sv:.config/sv
xorg/bspwmrc:.config/bspwm/bspwmrc
xorg/sxhkdrc:.config/sxhkd/sxhkdrc
"

for link in $LINKS; do
    IFS=":"
    set -- $link

    src="$PWD/$1"
    dest="$HOME/$2"

    [ -e "$src" ] || {
        echo "$src does not exist" >&2
        exit 1
    }

    basedir="${dest%/*}"

    mkdir -p "$basedir"
    ln -svfT "$src" "$dest"
done
