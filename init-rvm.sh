# RVM
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
   source "$HOME/.rvm/scripts/rvm"
elif [ -s /etc/profile.d/rvm.sh ]; then
   source /etc/profile.d/rvm.sh
elif [ -s /usr/local/rvm/scripts/rvm ]; then
   source /usr/local/rvm/scripts/rvm
fi
