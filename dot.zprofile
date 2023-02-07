#!/bin/zsh
# .zprofile

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

[ -s "/Users/tmurakam/.web3j/source.sh" ] && source "/Users/tmurakam/.web3j/source.sh"
