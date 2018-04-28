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
    export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
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

# pyenv
#if [ -e $HOME/.pyenv ]; then
#    export PYENV_ROOT="$HOME/.pyenv"
#    export PATH=$PYENV_ROOT/bin:$PATH
#    eval "$(pyenv init -)"
#fi

# venv
if [ -e $HOME/.venv/default ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    . $HOME/.venv/default/bin/activate
fi

#if [ -e $HOME/virtualenv/default ]; then
#    export VIRTUAL_ENV_DISABLE_PROMPT=1
#    . $HOME/virtualenv/default/bin/activate
#fi

# iTerm2 plugin
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Jabba
[ -s "/Users/tmurakam/.jabba/jabba.sh" ] && source "/Users/tmurakam/.jabba/jabba.sh"

# jenv
if [ -e $HOME/.jenv ]; then
    export PATH=$HOME/.jenv/bin:$PATH
    eval "$(jenv init -)"
fi
