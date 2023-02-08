#!/bin/bash
# .bash_profile

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

# Do not write any configurations here, because Ubuntu does not
# read .bash_profile but read .profile.
