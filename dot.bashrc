#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
    PS1="\n${GREEN}\u@\h${ENDCOLOR}:${LCYAN}\w${ENDCOLOR}\n\$ "

    # Ubuntu
    #PS1="${GREEN}\u@\h${ENDCOLOR}:${LBLUE}\w${ENDCOLOR}\$ "
    #PS1="\[\e]0;\u@\h: \w\a\]$PS1"

    # CYGWIN Prompt
    #PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
}

set_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#####################################################################
# Environment variables

ulimit -c 100000000

export EDITOR="emacs -nw"
export PAGER=less

# set proxy
. $HOME/dotfiles/set-proxy.sh

# less for global
export LESSGLOBALTAGS=global

# RVM
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    . "$HOME/.rvm/scripts/rvm"
fi

# Java
#export JAVA_HOME=/usr/java/jdk1.5.0_21/

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
