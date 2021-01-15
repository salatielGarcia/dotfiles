#!/bin/bash

cp -v ~/dotfiles/.vimrc ~/
# cp -v ~/dotfiles/.bashrc ~/
cp -v ~/dotfiles/.wxMaxima ~/
cp -v ~/dotfiles/style.ini ~/

mkdir -p ~/.config/picom/
mkdir -p ~/.config/mpv/
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/ftplugin
mkdir -p ~/.config/qtile/
mkdir -p ~/.config/termite/
mkdir -p ~/.config/vifm/
mkdir -p ~/.config/zathura/

cp -v picom.conf ~/.config/picom/
cp -v mpv.conf.bak ~/.config/mpv/
cp -v init.vim ~/.config/nvim/
cp -v *.vim ~/.config/nvim/ftplugin/
rm -v ~/.config/nvim/ftplugin/init.vim
cp -v autostart.sh ~/.config/qtile/
cp -v config.py ~/.config/qtile/
cp -v config ~/.config/termite/
cp -v vifmrc ~/.config/vifm/
cp -v zathurarc ~/.config/zathura/
