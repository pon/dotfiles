#!/usr/bin/env bash

set -e

function vimsetup {
 curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

 cp .vimrc ~/.vimrc

 vim +PlugInstall +qall
}

function tmuxsetup {
  cp ./.tmux.conf ~/.tmux.conf
}

vimsetup
tmuxsetup
