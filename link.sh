#!/bin/sh
cd `dirname "$0"`
for config in emacs tmux.conf tigrc gvimrc vimrc
do
  cmd="ln -is `pwd`/$config ~/.$config"
  echo $cmd
  eval $cmd
done
