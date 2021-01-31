# .zprofile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANG="ja_JP.utf8"

export EDITOR="emacs -nw"
export PAGER=less

# keychain
#eval $(~/dotfiles/bin/keychain --eval --timeout 1440 --agents ssh id_rsa)
eval $(~/dotfiles/bin/keychain --eval --timeout 10080)

# ssh-agent
#SSH_AGENT_FILE=$HOME/.ssh/agent
#if [ -e $SSH_AGENT_FILE ]; then
#    echo "Load ssh-agent config"
#    source $SSH_AGENT_FILE >/dev/null 2>&1
#fi
#if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
#    #killall ssh-agent
#    echo "Start up new ssh-agent"
#    ssh-agent -t 604800 > $SSH_AGENT_FILE
#    chmod 600 $SSH_AGENT_FILE
#    source $SSH_AGENT_FILE >/dev/null 2>&1
#fi

# Android
if [ -d $HOME/android-sdk-linux ]; then
    export ANDROID_HOME=$HOME/android-sdk-linux
    export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
fi

# Homebrew
if [ -d /opt/homebrew/bin ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# jenv
if [ -e $HOME/.jenv ]; then
    export PATH=$HOME/.jenv/bin:$PATH
    eval "$(jenv init -)"
fi

# Rust
if [ -e $HOME/.cargo ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
