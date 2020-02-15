#!/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

cd ~/.fzf/ \
  && ./install

#load vimrc

copy_vimrc(){
  #copy vimrc file
  sudo touch ~/.vimrc
  #always use abosolute path every time
  sudo scp -r /home/ganesh/bin_ganesh/setup/dotfiles/vim/vimrc ~/.vimrc
}

if [ -f ~/.vimrc ];then
  echo "file is present"
  sudo rm ~/.vimrc
  copy_vimrc
else
  echo "file is not present"
  copy_vimrc
fi


