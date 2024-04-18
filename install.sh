#!/bin/sh

# Install (by symlinking) all the config files to ~/.config
for i in $(ls) ; do
  if [ -d $i ] ; then
    echo "linking $i to ~/.config"
    ln -s $(pwd)/$i ~/.config
  fi
done
