#!/bin/bash

# .bash_profile

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
   . "$HOME/.bashrc"
fi

# MacPorts
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

umask 022

stty erase ^H

if [ -e /usr/bin/keychain ]; then
   eval `/usr/bin/keychain --eval --timeout 28800`
fi

