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

if [ -f $HOME/.bashrc_local ]; then
    . $HOME/.bashrc_local
fi

# common
if [ -e ~/dotfiles/dot.cmnrc ]; then
    . ~/dotfiles/dot.cmnrc
fi

# kubectl
if [ -s "/usr/bin/kubectl" -o -s "/usr/local/bin/kubectl" ]; then
    source <(kubectl completion bash)
    alias k=kubectl
    complete -o default -F __start_kubectl k
fi
