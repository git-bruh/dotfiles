#!/bin/sh -e

. "$(dirname "$0")/flags.sh"

bwrap \
    $DEFFLAGS \
    --bind "$HOME/Downloads/gomuks" "$HOME/Downloads" \
    --bind "$HOME/.config/gomuks" "$HOME/.config/gomuks" \
    --bind "$HOME/.local/share/gomuks" "$HOME/.local/share/gomuks" \
    "env -i /usr/bin/gomuks"
