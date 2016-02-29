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

# anyenv
#if [ -e $HOME/.anyenv ]; then
#    export PATH="$HOME/.anyenv/bin:$PATH"
#    eval "$(anyenv init -)"
#fi

# RVM
. $HOME/dotfiles/init-rvm.sh

# rbenv
if [ -e $HOME/.rbenv ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
