#!/bin/sh -e

bwrap \
    --dev /dev \
    --symlink usr/lib /lib \
    --ro-bind /usr/lib /usr/lib \
    --ro-bind /usr/bin /usr/bin \
    --bind "$HOME/Downloads/gomuks" "$HOME/Downloads" \
    --bind "$HOME/.cache/gomuks" "$HOME/.cache/gomuks" \
    --bind "$HOME/.config/gomuks" "$HOME/.config/gomuks" \
    --bind "$HOME/.local/share/gomuks" "$HOME/.local/share/gomuks" \
    /usr/bin/gomuks
