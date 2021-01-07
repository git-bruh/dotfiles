#!/bin/sh -e

DEFFLAGS="
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --ro-bind /usr/lib /usr/lib \
    --ro-bind /usr/lib64 /usr/lib64 \
    --ro-bind /usr/share/fonts /usr/share/fonts \
    --ro-bind /usr/share/icons /usr/share/icons \
    --ro-bind /usr/share/themes /usr/share/themes \
    --ro-bind /etc/fonts /etc/fonts \
    --ro-bind /etc/resolv.conf /etc/resolv.conf \
    --dev /dev \
    --proc /proc \
    --tmpfs /tmp \
    --bind $HOME/.config/gtk-3.0 $HOME/.config/gtk-3.0 \
    --unshare-all \
    --share-net \
    --hostname RESTRICTED \
    --setenv PATH /usr/bin \
    --die-with-parent \
    --new-session \
"
