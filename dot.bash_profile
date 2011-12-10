#!/bin/bash

# .bash_profile

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
   . "$HOME/.bashrc"
fi

if [ -d "$HOME/bin" ]; then
   PATH=$HOME/bin:$PATH
fi

# Android SDK
ANDROID_HOME=$HOME/android-sdk-linux
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH

# RVM
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
   source "$HOME/.rvm/scripts/rvm"
fi

umask 022

stty erase ^H

if [ -e /usr/bin/keychain ]; then
   eval `/usr/bin/keychain --eval --timeout 28800`
fi

