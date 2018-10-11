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

function gitsetup {
  git config --global user.name "Peter Nagel"
  git config --global user.email "pnagel5@gmail.com"
  git config --global core.editor vim
  git config --global alias.pl pull
  git config --global alias.gp push
  git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
}

vimsetup
tmuxsetup
gitsetup
