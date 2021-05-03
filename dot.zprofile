# .zprofile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -e /etc/redhat-release ]; then
    export LANG="ja_JP.utf8"
else
    export LANG="ja_JP.UTF-8"
fi

export EDITOR="emacs -nw"
export PAGER=less

# keychain
#eval $(~/dotfiles/bin/keychain --eval --timeout 1440 --agents ssh id_rsa)
eval $(~/dotfiles/bin/keychain --eval --timeout 10080)

