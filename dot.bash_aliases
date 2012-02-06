# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# user defines aliases
#
#alias ls='ls -FC --color=auto'
alias rm='rm -i'
alias rm~='/bin/rm *~'
alias cp='cp -i'
alias r='pushd +1'
alias grep='grep -i'

#alias  xdvi	xdvi -fg white -bg black

alias tounix='qkc -e -u'
alias todos='qkc -s -m'

# global
alias gx='global -x'
alias gr='global -xr'
alias gg='global -xg'
alias gf='global -xf'

#alias less='echo do not use less!'

#alias xe='~/Morphon_XML-Editor_3.1.4/Morphon_XML-Editor_3.1.4'

alias ng='emacs -nw'
alias euc2utf8='iconv -f euc-jp -t utf-8'
