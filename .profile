export CFLAGS="-O3 -pipe -march=native -fdevirtualize-at-ltrans -fno-semantic-interposition -fipa-pta -flto=auto -fuse-linker-plugin -fgraphite-identity -floop-nest-optimize"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,-O1 -Wl,--as-needed $CFLAGS"
export MAKEFLAGS="-j12"

export KISS_PATH=""
export KISS_HOOK=$HOME/kiss/kiss-hook
export KISS_TMPDIR=/tmp
KISS_PATH=$KISS_PATH:$HOME/kiss/grepo/core
KISS_PATH=$KISS_PATH:$HOME/kiss/grepo/extra
KISS_PATH=$KISS_PATH:$HOME/kiss/grepo/xorg
KISS_PATH=$KISS_PATH:$HOME/kiss/kiss-repo/repo
KISS_PATH=$KISS_PATH:$HOME/kiss/community/community
KISS_PATH=$KISS_PATH:$HOME/kiss/gcommunity/community

export FZF_DEFAULT_OPTS="--color=bw"

PATH=$PATH:$HOME/.local/bin

if [ -z $DISPLAY ] && [ $(tty) == /dev/tty1 ]; then exec startx -- -dpi 120; fi