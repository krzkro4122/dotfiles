#!/bin/bash

cp -r .config ~
cp -r .dotfiles ~
cp -r .vim ~
cp .zshrc ~

tmux

nvim +PlugInstall
