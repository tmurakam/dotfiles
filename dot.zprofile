# .zprofile

#export PATH=$PATH:/sbin:/usr/sbin
#export PATH=$PATH:/usr/java/jre1.5.0_10/bin
export PATH=$PATH:$HOME/script

stty erase ^H
eval `/usr/bin/keychain --eval --timeout 28800`
