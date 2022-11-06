#!/bin/bash

# For Linux users -> Run with sudo

# Determine the system's package manager and us it to install needed packages
PACKAGE_MANAGER=${1}  # (f.e. apt, yum, brew)

install_packages () {
    echo "Installing packages..."

    if [[ "${PACKAGE_MANAGER}" == "apt" ]]; then
        echo "Adding apt repo with nvim 0.7+..."
        sudo apt-get install software-properties-common
        sudo add-apt-repository ppa:neovim-ppa/stable
    fi
    sudo ${PACKAGE_MANAGER} update -y && \
    sudo ${PACKAGE_MANAGER} upgrade -y
    sudo ${PACKAGE_MANAGER} install -y zsh tmux neovim curl fzf
    chsh -s /bin/zsh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

get_assets () {
    echo "Collecting assets..."
    # Get the p10k source code
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    # Install the Meslo font
    ./install.sh Meslo
}

distribute_files () {
    echo "Distributing files..."
    cp -r .config/ ~
    cp -r .dotfiles/ ~
    cp -r .vim/ ~
    cp .zshrc ~
}

tmux_init () {
    echo "Configuring tmux..."
    tmux source-file ~/.dotfiles/.tmux.conf
    # tmux new
}

install_packages && get_assets && distribute_files && tmux_init
