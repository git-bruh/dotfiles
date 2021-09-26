#!/bin/sh

export CFLAGS="-O3 -pipe -march=x86-64-v2 -mtune=generic -fno-math-errno -fstack-protector-strong --param ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"

export CMAKE_GENERATOR=Ninja

export KISS_PATH=
export KISS_TMPDIR=/tmp
export KISS_COMPRESS=xz
export KISS_SU=ssu
export KISS_HOOK="$HOME/git/git/dotfiles/kiss-hook"
KISS_PATH="$KISS_PATH:$HOME/git/git/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/nvidia"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/wayland"
KISS_PATH="$KISS_PATH:$HOME/kiss/community/community"
KISS_PATH="$KISS_PATH:$HOME/kiss/gcommunity/community"
KISS_PATH="$KISS_PATH:$HOME/git/git/kiss-repo/repo"

export PS1="λ "

export ASAN_OPTIONS="log_path=./ASAN"
export GOPATH="$HOME/.cache/go"
export DART_VM_OPTIONS=--root-certs-file=/etc/ssl/cert.pem
export CONFIG_DIR=.config
export EDITOR=vi
export GTK_THEME=dracula-gtk-theme
export LANG=en_US.UTF8
export MOZ_ENABLE_WAYLAND=1
export XDG_RUNTIME_DIR=/tmp

PATH="$HOME/git/git/dotfiles/bin:$PATH"
PATH="$PATH:$HOME/git/android/Sdk/platform-tools:$HOME/git/android/flutter/bin"

if [ "$(tty)" = /dev/tty1 ]; then
	exec sway --my-next-gpu-wont-be-nvidia;
fi
