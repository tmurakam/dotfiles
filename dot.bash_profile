# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# keychain, see http://www.gentoo.org/doc/ja/keychain-guide.xml
#
eval `/usr/bin/keychain --eval --timeout 28800`
