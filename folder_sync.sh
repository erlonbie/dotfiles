#!/bin/sh

[ -f  ] && rm  

# bash
# [ -f  ~/.bashrc ] && rm ~/.bashrc
#  ln -s ~/.config/dotfiles/.bashrc ~/.bashrc

# alacritty
[ -f  ~/.alacritty.yml ] && rm -v ~/.alacritty.yml
ln -s ~/.config/dotfiles/.alacritty.yml ~/.alacritty.yml

# vim
[ -f ~/.vimrc ] && rm -v ~/.vimrc 
ln -s ~/.config/dotfiles/.vimrc ~/.vimrc

# tmux
[ -f ~/.tmux.conf ] && rm -v ~/.tmux.conf 
ln -s ~/.config/dotfiles/.tmux.conf ~/.tmux.conf

# coc-settings
[ -f ~/.vim/coc-settings.json ] && rm -v ~/.vim/coc-settings.json 
ln -s ~/.config/dotfiles/coc-settings.json ~/.vim/coc-settings.json

# compton
[ -f ~/.config/compton/compton.conf ] && rm -v ~/config/compton/compton.conf 
ln -s ~/.config/dotfiles/compton.conf ~/.config/compton/compton.conf

# rofi
[ ! -d ~/.config/rofi ] && mkdir ~/.config/rofi
[ -f ~/.config/rofi/config.rasi ] && rm -v ~/.config/rofi/config.rasi 
ln -s ~/.config/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi

# qtile
[ -d ~/.config/qtile/ ] && rm -rfv ~/.config/qtile/* 
ln -s ~/.config/dotfiles/qtile/* ~/.config/qtile/

# ranger
[ -d ~/.config/ranger/ ] && rm -rfv ~/.config/ranger/* 
ln -s ~/.config/dotfiles/ranger/* ~/.config/ranger/
