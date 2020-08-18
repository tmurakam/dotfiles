# .zprofile

#export PATH=$PATH:/sbin:/usr/sbin
#export PATH=$PATH:/usr/java/jre1.5.0_10/bin
export PATH=$PATH:$HOME/script

#stty erase ^H
#eval `/usr/bin/keychain --eval --timeout 28800`

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
