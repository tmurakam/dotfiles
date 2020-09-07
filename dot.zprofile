# .zprofile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANG="ja_JP.utf8"

export EDITOR="emacs -nw"
export PAGER=less
