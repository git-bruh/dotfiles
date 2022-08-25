#!/bin/sh

export CFLAGS="-O3 -pipe -march=x86-64-v2 -mtune=generic -fno-math-errno -fstack-protector-strong --param ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"

export SVDIR="$HOME/.config/sv"

export WLR_NO_HARDWARE_CURSORS=1

export PS1="λ "
export EDITOR=vi
export LANG=en_US.UTF8
export XDG_RUNTIME_DIR="/tmp/$(whoami)"
export GTK_THEME=Qogir-dark

export ASAN_OPTIONS="log_path=./ASAN"
export TSAN_OPTIONS="log_path=./TSAN"

export MOZ_WEBRENDER=1
export MOZ_ENABLE_WAYLAND=1

export CHROME_FLAGS="--ozone-platform=x11"

export CMAKE_GENERATOR=Ninja

export KISS_PATH=
export KISS_TMPDIR=/tmp/kiss
export KISS_GET=axel
export KISS_SU=ssu

KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-xorg/extra"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-repo/repo"
KISS_PATH="$KISS_PATH:$HOME/KISS/kiss-xorg/xorg"
# KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/wayland"
KISS_PATH="$KISS_PATH:$HOME/KISS/grepo/nvidia"
KISS_PATH="$KISS_PATH:$HOME/KISS/community/community"

export ANDROID_SDK_ROOT="$HOME/Development/Android"
export ANDROID_USER_HOME="$ANDROID_SDK_ROOT/.android"
export ANDROID_EMULATOR_HOME="$ANDROID_USER_HOME"
export DART_VM_OPTIONS="--root-certs-file=/etc/ssl/cert.pem"
export GRADLE_USER_HOME="$ANDROID_USER_HOME"
export JAVA_HOME="$ANDROID_SDK_ROOT/java"

PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

PATH="$HOME/Development/Repos/dotfiles/bin:$PATH"

mkdir -p "$XDG_RUNTIME_DIR"

[ "$(tty)" = "/dev/tty1" ] && startx /usr/bin/bspwm
