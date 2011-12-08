#!/bin/sh
mount "d:\ICF_AutoCapsule_disabled\home" /home/tmurakam
export HOME=/home/tmurakam
cd $HOME

export ANDROID_HOME=/cygdrive/d/android/android-sdk-windows

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
unset GIT_SSH

. ~/.bashrc
