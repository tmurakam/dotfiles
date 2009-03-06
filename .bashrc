# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Path
export PATH=$PATH:/sbin:/usr/sbin:$HOME/devbin

# Locale
export LANG=ja_JP.utf8

export PS1="\[\033[1;34m\][\j:\!]\h %\[\033[0m\] "
export IGNOREEOF=100
export PAGER=less
export EDITOR=vim
#export EDITOR="emacs -nw"

#ulimit -c 100000000

# redefine cd and back
cd()
{
    export old=$PWD
    builtin cd "$@"
#    echo "## $PWD ##"
#    ls
}

back()
{
    export old2=$PWD
    builtin cd $old
    export old=$old2
#    echo "## $PWD ##"
#    ls
}


#
# CVS
#
#export CVSROOT=any.host.name:/cvs/directory/here
#export CVS_RSH=ssh

#
# ElectricFence (see 'man libefence')
#
#export EF_PROTECT_BELOW=0
#export EF_PROTECT_FREE=1

# eBorder driver
#CLIENTPROXY_CONF=/usr/local/eborder/etc/clientproxy.conf
#export CLIENTPROXY_CONF
#PATH=$PATH:/usr/local/eborder/bin

# Proxy server
#export http_proxy=http://your.proxy.server:8080/
#export ftp_proxy=http://your.proxy.server:8080/

# Use GNU global tags with less
#export LESSGLOBALTAGS=global

# Java
#export JAVA_HOME=/usr/java/jdk_your_version
