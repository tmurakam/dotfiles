#!/bin/sh
rm dot.*~
for i in dot.*; do
    tofile=`echo $i | sed 's/^dot//'`
    cmd="/usr/bin/cp $i $HOME/$tofile"
    echo $cmd
    $cmd
done
