#!/bin/sh

export CFLAGS="-O3 -pipe -march=x86-64-v2 -mtune=generic -fno-math-errno -fstack-protector-strong --param ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j8"

export SVDIR="$HOME/.config/sv"

export WLR_NO_HARDWARE_CURSORS=1

export PS1="λ "
export EDITOR=vi
export LANG=en_US.UTF8
export XDG_RUNTIME_DIR="/tmp/$(whoami)"
export GTK_THEME=Catppuccin-Mocha

export ASAN_OPTIONS="log_path=./ASAN"
export TSAN_OPTIONS="log_path=./TSAN"

export MOZ_WEBRENDER=1
export MOZ_ENABLE_WAYLAND=1

export CMAKE_GENERATOR=Ninja

export KISS_PATH=
export KISS_TMPDIR=/tmp/kiss
export KISS_GET=axel

KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/nvidia"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/wayland"
KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-repo/repo"
KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-repo/android"
KISS_PATH="$KISS_PATH:$HOME/KISS/community/community"

PATH="$HOME/Development/Repos/dotfiles/bin:$PATH"

mkdir -p "$XDG_RUNTIME_DIR"

[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu
