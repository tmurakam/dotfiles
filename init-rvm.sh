# RVM
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
   source "$HOME/.rvm/scripts/rvm"
elif [ -s /etc/profile.d/rvm.sh ]; then
   source /etc/profile.d/rvm.sh
elif [ -s /usr/local/rvm/scripts/rvm ]; then
   source /usr/local/rvm/scripts/rvm
fi

# rbenv
RBENV_ROOT=dummy
if [ -d "$HOME/.rbenv/bin" ]; then
    export RBENV_ROOT=$HOME/.rbenv
elif [ -d "/usr/local/rbenv" ]; then
    export RBENV_ROOT=/usr/local/rbenv
fi
if [ -d $RBENV_ROOT ]; then
    export PATH=$RBENV_ROOT/bin:$PATH
    eval "$(rbenv init -)"
fi
