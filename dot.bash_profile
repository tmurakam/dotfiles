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

if [ -d "$HOME/bin" ]; then
   PATH=$HOME/bin:$PATH
fi

# Android SDK
if [ -e $HOME/android-sdk ]; then
    export ANDROID_HOME=$HOME/android-sdk
    export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi

if [ -e /usr/bin/keychain ]; then
   eval `/usr/bin/keychain --eval --timeout 28800`
fi

# RVM
. $HOME/dotfiles/init-rvm.sh
