# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

##############################################################################

source .bash_aliases

# Locale
export LANG=ja_JP.UTF-8

# Prompt
export PROMPT="%B%{${fg[blue]}%}[%T]%n@%m %%%{${reset_color}%}%b "
export RPROMPT="%B%{${fg[red]}%}[%~]%{${reset_color}%}%b "
export PROMPT2="%_%%"

# Show current directory to terminal
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac 

# Command history
#HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#
# enviroment variables
#
export EDITOR="emacs -nw"
export PAGER=less

ulimit -c 100000000

# less for global
export LESSGLOBALTAGS=global
