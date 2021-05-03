#!/bin/bash

#echo ".bashrc start"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# set proxy
. $HOME/dotfiles/set-proxy.sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#########################################################################

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#
# Set Prompt
#
# Note: \u - username, \h - hostname, \w - current dir, \n - newline
# \a - bell, \e - escape (\033), \[ and \] - non display sequence

function set_prompt
{
    local GREEN="\[\e[0;32m\]"
    local LRED="\[\e[1;31m\]"
    local LBLUE="\[\e[1;34m\]"
    local LCYAN="\[\e[1;36m\]"
    local LPURPLE="\[\e[1;35m\]"
    local YELLOW="\[\e[1;33m\]"
    local ENDCOLOR="\[\e[00m\]"

    # My Prompt
    PS1="${GREEN}\u@\h${ENDCOLOR}:${LCYAN}\w${ENDCOLOR}\n\$ "

    # Ubuntu
    #PS1="${GREEN}\u@\h${ENDCOLOR}:${LBLUE}\w${ENDCOLOR}\$ "
    #PS1="\[\e]0;\u@\h: \w\a\]$PS1"

    # CYGWIN Prompt
    #PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
}

set_prompt

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    fi
    # homebrew
    if [ -d /usr/local/etc/bash_completion.d ]; then
	for f in /usr/local/etc/bash_completion.d/*; do
	    . $f
	done
    fi
fi


#####################################################################
# Environment variables

# Android
if [ -d $HOME/android-sdk-linux ]; then
    export ANDROID_HOME=$HOME/android-sdk-linux
    export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
fi

# commands
up() { eval `~/dotfiles/upto $1`; }

if [ -f $HOME/.bashrc_local ]; then
    . $HOME/.bashrc_local
fi

# Show current directory to terminal
#case "${TERM}" in
#kterm*|xterm)
#    precmd() {
#        echo -ne "\e]0;${USER}@${HOST%%.*}:${PWD}\007"
#    }
#    ;;
#esac 

# enviroment variables
#export EDITOR=vi
export EDITOR="emacs -nw"
export PAGER=less

#ulimit -c 100000000
   
# less for global
export LESSGLOBALTAGS=global

# RVM
if [ -e $HOME/dotfiles/init-rvm.sh ]; then
    . $HOME/dotfiles/init-rvm.sh
fi

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

# jenv
if [ -e $HOME/.jenv ]; then
    export PATH=$HOME/.jenv/bin:$PATH
    eval "$(jenv init -)"
fi

# Rust
if [ -e $HOME/.cargo ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# kubectl
if [ -s "/usr/bin/kubectl" -o -s "/usr/local/bin/kubectl" ]; then
    source <(kubectl completion bash)
    alias k=kubectl
    complete -o default -F __start_kubectl k
fi
if [ -d ${HOME}/.krew/bin ]; then
    export PATH="${PATH}:${HOME}/.krew/bin"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
[ ! -s /Users/tmurakam/.travis/travis.sh ] || source /Users/tmurakam/.travis/travis.sh
