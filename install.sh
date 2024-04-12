#!/bin/bash

read -p "This script will overwrite your nvim and tmux config. Do you want to continue? (y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    TMP_DIR=/tmp/dotfiles_tmp
    LOCAL_BIN_DIR=~/test/.local
    NVIM_CONFIG_DIR=~/test/.config
    TMUX_CONFIG_DIR=~/test/.tmux.conf
    REQUIRED_PKG="fzf"

    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
    echo "Checking if $REQUIRED_PKG is installed..."

    if [ "" = "$PKG_OK" ]; then
        echo "$REQUIRED_PKG is not installed. Installing $REQUIRED_PKG now."
        sudo apt-get install -y fzf
    fi

    printf "Cloning repo to temp folder...\n"
    git clone https://github.com/aymxdd/dotfiles $TMP_DIR

    printf "Copying utils scripts...\n"
    mkdir -p $LOCAL_BIN_DIR
    cp -R $TMP_DIR/local/bin $LOCAL_BIN_DIR
    chmod +x $LOCAL_BIN_DIR/bin/tmux-sessionizer
    chmod +x $LOCAL_BIN_DIR/bin/tmux-session

    printf "Installing nvim config...\n"
    mkdir -p $NVIM_CONFIG_DIR
    cp -R $TMP_DIR/config/nvim $NVIM_CONFIG_DIR

    printf "Installing tmux config...\n"
    cp -R $TMP_DIR/tmux.conf $TMUX_CONFIG_DIR

    printf "Cleaning up temp files...\n"
    rm -rf $TMP_DIR

    printf "Done!\n Please restart your terminal to see the changes.\n"
fi

