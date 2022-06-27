#!/bin/sh

export CFLAGS="-O3 -pipe -march=x86-64-v2 -mtune=generic -fno-math-errno -fstack-protector-strong --param ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"

export CMAKE_GENERATOR=Ninja

export KISS_PATH=
export KISS_TMPDIR=/tmp
export KISS_COMPRESS=xz
export KISS_GET=axel
export KISS_SU=ssu
KISS_PATH="$KISS_PATH:$HOME/git/git/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/nvidia"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/wayland"
KISS_PATH="$KISS_PATH:$HOME/kiss/community/community"
KISS_PATH="$KISS_PATH:$HOME/git/git/kiss-repo/repo"

export PS1="λ "

export ASAN_OPTIONS="log_path=./ASAN"
export TSAN_OPTIONS="log_path=./TSAN"
export GOPATH="$HOME/.cache/go"
export DART_VM_OPTIONS=--root-certs-file=/etc/ssl/cert.pem
export CONFIG_DIR=.config
export EDITOR=vi
export LANG=en_US.UTF8
export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export XDG_RUNTIME_DIR="/tmp/$(whoami)"
export MOZ_WEBRENDER=1
export WLR_NO_HARDWARE_CURSORS=1
export GTK_THEME=Qogir-dark

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/git/git/dotfiles/bin:$PATH"

export ANDROID_HOME="$HOME/git/Android"
export ANDROID_USER_HOME="$ANDROID_HOME/.android"
export ANDROID_EMULATOR_HOME="$ANDROID_USER_HOME"
export JAVA_HOME="$ANDROID_HOME/java"

PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin"
PATH="$PATH:$ANDROID_HOME/platform-tools"

mkdir -p "$XDG_RUNTIME_DIR"

if [ "$(tty)" = /dev/tty1 ]; then
   	exec sway --unsupported-gpu
fi
