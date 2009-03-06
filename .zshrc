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

autoload -U compinit
compinit
zstyle ':completion:*' list-colors ''

##############################################################################
# aliases
#
setopt complete_aliases
alias ls='ls -FC --color=auto'
alias rm='rm -i'
alias rm~='/bin/rm *~'
alias cp='cp -i'
alias r='pushd +1'
alias grep='grep -i'

alias  lynx='lynx -emacskeys'
alias  a2ps='a2ps --encoding=euc-jp'

alias  cs='/usr/local/bin/cs */*.[ch]* */*/*.[ch]* */*/*/*.[ch]* */*/*/*/*.[ch]*'

alias make=gmake

#alias  xdvi	xdvi -fg white -bg black

alias tounix='qkc -e -u'
alias todos='qkc -s -m'

alias rcvs='socksify cvs'

alias homeimap='runsocks ssh -g -L 8143:mustang:143 tmurakam.dyndns.org'

#alias ipaqsc='ssh root@ipaq1 /usr/X11R6/bin/xwd -display :0.0 -root'
alias ipaqsc='ssh root@10.52.30.220 /usr/X11R6/bin/xwd -display :0.0 -root'

alias ssa='ssh-agent bash'

# global
alias gx='global -x'
alias gr='global -xr'
alias gg='global -xg'
alias gf='global -xf'

#alias less='echo do not use less!'

#alias xe='~/Morphon_XML-Editor_3.1.4/Morphon_XML-Editor_3.1.4'

#eclipse
alias eclipse='PATH=/usr/java/jre1.5.0_10/bin:$PATH /usr/local/eclipse/eclipse'

alias firefox=/usr/local/firefox/firefox
alias thunderbird=/usr/local/thunderbird/thunderbird

alias ng='emacs -nw'

##############################################################################

# Locale
export LANG=ja_JP.eucJP
#export LANG=ja_JP.UTF-8
#alias man="/home/tmurakam/bin/uman"

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

#
# enviroment variables
#
export EDITOR="emacs -nw"
export PAGER=less

ulimit -c 100000000

# proxy
export http_proxy=http://proxy.spf.cl.nec.co.jp:3128/
export ftp_proxy=http://proxy.spf.cl.nec.co.jp:3128/

export EDITOR="emacs -nw"
export PAGER=less

#
# CVS
#

#export CVSROOT	/proj/mdl/IPv6/cvsroot
#export CVSROOT /proj/mdl/tcpip/RT2/cvsroot
#export CVSROOT	/proj/mdl/etcpip/cvstest
#export CVSROOT	/proj/mdl/tcpip/cvsroot
#export CVSROOT=/proj/mdl/etcpip/cvsroot
#export CVSROOT=:pserver:tmurakam@turkey.ptl.yh.nec.co.jp:/home/monster
#export CVSROOT=:pserver:tmurakam@turkey.ptl.yh.nec.co.jp:/work/morpheus/cvs
#export CVSROOT=turkey.spf.cl.nec.co.jp:/work/morsov/cvs
#export CVSROOT=turkey.spf.cl.nec.co.jp:/work/morpheus/cvs
#export CVS_RSH=ssh

# less for global
export LESSGLOBALTAGS=global

# ns-2
PATH=$PATH:~/ns-2.31/bin:~/ns-2.31/tcl8.4.14/unix:~/ns-2.31/tk8.4.14/unix
#PATH=$PATH:~/ns-2.33/bin:~/ns-2.33/tcl8.4.14/unix:~/ns-2.33/tk8.4.14/unix
#PATH=$PATH:~/mannasim/bin

# Java
export JAVA_HOME=/usr/java/jdk1.5.0_05

# UNIZONE
#export MOAPL_ROOT=/home/unizone/20070113UNZ_Av1000320-vcc
export MOAPL_ROOT=/home/unizone/20070113UNZ_Av1000320
export PATH=$PATH:~/bldwz

# OCEAN
#
#export MOAPL_ROOT=/home/ocean/20080524OCE_Av1000500
#export MOAPL_ROOT=/home/kakumaru/ocean/20080524OCE_Av1000500/OCEAN
#export PATH=$PATH:~/OCE_BW
