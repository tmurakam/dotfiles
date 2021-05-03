#!/bin/bash

# .bash_profile

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
   . "$HOME/.bashrc"
fi

umask 022

if [ -d "$HOME/bin" ]; then
   PATH=$HOME/bin:$PATH
fi

# Android SDK
if [ -e $HOME/android-sdk ]; then
    export ANDROID_HOME=$HOME/android-sdk
    export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
fi

# keychain
#eval $(~/dotfiles/bin/keychain --eval --timeout 1440 --agents ssh id_rsa)
eval $(~/dotfiles/bin/keychain --eval --timeout 1440)

# ssh-agent
#SSH_AGENT_FILE=$HOME/.ssh/agent
#if [ -e $SSH_AGENT_FILE ]; then
#    echo "Load ssh-agent config"
#    source $SSH_AGENT_FILE >/dev/null 2>&1
#fi
#if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
#    #killall ssh-agent
#    echo "Start up new ssh-agent"
#    ssh-agent -t 28800 > $SSH_AGENT_FILE
#    chmod 600 $SSH_AGENT_FILE
#    source $SSH_AGENT_FILE >/dev/null 2>&1
#fi

# anyenv
#if [ -e $HOME/.anyenv ]; then
#    export PATH="$HOME/.anyenv/bin:$PATH"
#    eval "$(anyenv init -)"
#fi

