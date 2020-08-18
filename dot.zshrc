#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

fpath=(~/zsh/functions ${fpath})

# 補完
autoload -U compinit
compinit
zstyle ':completion:*' list-colors ''

# 補完を無効化するコマンド
compdef -d svn
compdef -d git

##############################################################################
# aliases

setopt complete_aliases
. ~/.bash_aliases

##############################################################################

# Locale
export LANG=ja_JP.UTF-8

# Prompt
autoload colors
colors
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
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# Key binding
bindkey -e

# options
setopt auto_cd
#setopt auto_pushd
setopt correct
setopt list_packed

#########################################
# enviroment variables
export EDITOR="emacs -nw"
export PAGER=less

ulimit -c 100000000

# Jabba
#[ -s "/Users/tmurakam/.jabba/jabba.sh" ] && source "/Users/tmurakam/.jabba/jabba.sh"

# kubectl
if [ -s "/usr/bin/kubectl" -o -s "/usr/local/bin/kubectl" ]; then
    source <(kubectl completion zsh)
    #alias k=kubectl
    #complete -o default -F __start_kubectl k
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
