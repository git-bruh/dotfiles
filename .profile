#!/bin/sh

export CFLAGS="-O3 -pipe -march=native -mtune=native -fno-math-errno -fdevirtualize-at-ltrans -fno-semantic-interposition -fipa-pta -flto=auto -fuse-linker-plugin -fgraphite-identity -floop-nest-optimize -fuse-ld=gold"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,-O1 -Wl,--as-needed $CFLAGS"
export MAKEFLAGS="-j12"

export CMAKE_GENERATOR=Ninja

export KISS_PATH=
export KISS_TMPDIR=/tmp
export KISS_COMPRESS=xz
export KISS_HOOK="$HOME/kiss/kiss-hook"
KISS_PATH="$KISS_PATH:$HOME/kiss/kiss-repo/wayland"
KISS_PATH="$KISS_PATH:$HOME/kiss/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/kiss/kissLTO/repo"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/xorg"
KISS_PATH="$KISS_PATH:$HOME/kiss/community/community"
KISS_PATH="$KISS_PATH:$HOME/kiss/gcommunity/community"
KISS_PATH="$KISS_PATH:$HOME/kiss/kiss-repo/repo"

export PS1="-> "

export CHROME_FLAGS="--enable-features=UseOzonePlatform --ozone-platform=wayland"
export CONFIG_DIR=".config"
export EDITOR=vi
export GOPATH="$HOME/.cache/go"
export LANG=en_US.UTF8
export MOZ_ENABLE_WAYLAND=1
export XDG_RUNTIME_DIR=/tmp

PATH="$HOME/git/git/dotfiles/bin:$PATH"

if [ "$(tty)" = /dev/tty1 ]; then exec sway --my-next-gpu-wont-be-nvidia; fi
