#!/bin/bash

# Linux -> Run with sudo

install_packages () {
    # Determine the system's package manager and us it to install needed packages
    PACKAGE_MANAGER=${1}
    ${PACKAGE_MANAGER} update -y && \
    ${PACKAGE_MANAGER} upgrade -y
    ${PACKAGE_MANAGER} install -y zsh tmux neovim curl fzf which
    chsh -s $(which zsh)
}

get_assets () {
    # Get the p10k source code
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    # Get the Meslo font
    git clone https://github.com/ryanoasis/nerd-fonts.git && cd nerd-fonts && ./install.sh Meslo && cd -
}

distribute_files () {
    # Distribute configuration files
    cp  -r   .config   ~
    cp  -r   .dotfiles ~
    cp  -r   .vim      ~
    cp       .zshrc    ~
}

tmux_vim_init () {
    tmux source-file ~/.dotfiles/.tmux.conf
    tmux new 'nvim +PlugInstall'
}

install_packages && get_assets && distribute_files && tmux_vim_init