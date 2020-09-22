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
#eval `~/dotfiles/bin/keychain --eval --agents ssh id_rsa`
eval `~/dotfiles/bin/keychain --eval`

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

# RVM
. $HOME/dotfiles/init-rvm.sh

# rbenv
if [ -d "$HOME/.rbenv/bin" ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
elif [ -d "/usr/local/rbenv" ]; then
    export PATH=/usr/local/rbenv/bin:$PATH
    eval "$(rbenv init -)"
elif [ -x "/usr/local/bin/rbenv" ]; then # homebrew
    eval "$(rbenv init -)"
fi

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# pyenv / venv
if [ -e "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
elif [ -e $HOME/.venv/default ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    . $HOME/.venv/default/bin/activate
fi

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# iTerm2 plugin
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Jabba: deprecated, use sdkman
#[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# jenv
if [ -e $HOME/.jenv ]; then
    export PATH=$HOME/.jenv/bin:$PATH
    eval "$(jenv init -)"
fi

# Rust
if [ -e $HOME/.cargo ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
