#!/bin/sh

export CFLAGS="-O3 -pipe -march=x86-64-v2 -mtune=generic -fno-math-errno -fstack-protector-strong --param ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"

export PS1="λ "
export EDITOR=vi
export LANG=en_US.UTF8
export XDG_RUNTIME_DIR="/tmp/$(whoami)"
export GTK_THEME=Qogir-dark

export ASAN_OPTIONS="log_path=./ASAN"
export TSAN_OPTIONS="log_path=./TSAN"

export MOZ_WEBRENDER=1

export CMAKE_GENERATOR=Ninja

export KISS_PATH=
export KISS_TMPDIR=/tmp/kiss
export KISS_GET=axel
export KISS_SU=ssu

KISS_PATH="$KISS_PATH:$HOME/git/git/kiss-repo/overrides"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/core"
KISS_PATH="$KISS_PATH:$HOME/kiss/grepo/extra"
KISS_PATH="$KISS_PATH:$HOME/kiss/community/community"
KISS_PATH="$KISS_PATH:$HOME/git/git/kiss-repo/repo"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/git/git/dotfiles/bin:$PATH"

export ANDROID_SDK_ROOT="$HOME/git/Android"
export ANDROID_USER_HOME="$ANDROID_SDK_ROOT/.android"
export ANDROID_EMULATOR_HOME="$ANDROID_USER_HOME"
export DART_VM_OPTIONS="--root-certs-file=/etc/ssl/cert.pem"
export GRADLE_USER_HOME="$ANDROID_USER_HOME"
export JAVA_HOME="$ANDROID_SDK_ROOT/java"

PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

mkdir -p "$XDG_RUNTIME_DIR"

if [ "$(tty)" = /dev/tty1 ]; then
   	exec sway --unsupported-gpu
fi
