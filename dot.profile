#!/bin/sh

# .profile

umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# keychain
#eval $(~/dotfiles/bin/keychain --eval --timeout 1440 --agents ssh id_rsa)
eval $(~/dotfiles/bin/keychain --eval --timeout 1440)

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -e /etc/redhat-release ]; then
    export LANG="ja_JP.utf8"
else
    export LANG="ja_JP.UTF-8"
fi

# Android SDK
if [ -e $HOME/android-sdk ]; then
    export ANDROID_HOME=$HOME/android-sdk
    export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
fi
