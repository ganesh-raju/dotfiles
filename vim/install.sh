#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

cd ~/.fzf/ \
  && ./install

#load vimrc

copy_vimrc(){
  #copy vimrc file
  touch ~/.vimrc
  cp -R ./vimrc ~/.vimrc
}

if [ -f ~/.vimrc ];then
  echo "file is present"
  rm ~/.vimrc
  copy_vimrc
else
  echo "file is not present"
  copy_vimrc
fi


