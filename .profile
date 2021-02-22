#!/bin/sh

export CFLAGS="-O2 -pipe -march=native"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j12"

export KISS_TMPDIR=/tmp
export KISS_HOOK="$HOME/kiss/kiss-hook"
KISS_PATH="$HOME/kiss/kiss-repo/optim"
KISS_PATH="$KISS_PATH:$HOME/kiss/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/xorg"
KISS_PATH="$KISS_PATH:$HOME/kiss/community/community"
KISS_PATH="$KISS_PATH:$HOME/kiss/gcommunity/community"
KISS_PATH="$KISS_PATH:$HOME/kiss/kiss-repo/repo"

export PS1="-> "
export EDITOR=micro

PATH="/usr/lib/ccache/bin:$HOME/git/dotfiles/bin:$PATH"

if [ "$(tty)" = /dev/tty1 ]; then exec startx -- -dpi 120 -ardelay 200 -arinterval 20; fi
