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

alias tounix='nkf -w -Lu -d --in-place'
alias todos='nkf -s -Lw -c --in-place'

# global
alias gx='global -x'
alias gr='global -xr'
alias gg='global -xg'
alias gf='global -xf'

#alias less='echo do not use less!'

#alias xe='~/Morphon_XML-Editor_3.1.4/Morphon_XML-Editor_3.1.4'

#alias ng='emacs -nw'
alias e=vi
alias ee='emacs -nw'
alias euc2utf8='iconv -f euc-jp -t utf-8'

# git
alias glg='git log --graph --date=iso --pretty=format:"%h [%ad] %s %Cred%d%Creset"'
alias gsa='git for-each-ref --format "%(refname:short) %(upstream:trackshort)" refs/heads'

# mvn
alias ddu='mvn versions:display-dependency-updates'
alias dpu='mvn versions:display-plugin-updates'

# kubectl
alias kc=kubectl
