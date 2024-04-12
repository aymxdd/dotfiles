#!/bin/bash

read -p "This script will overwrite your nvim and tmux config. Do you want to continue? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    TMP_DIR=/tmp/dotfiles_tmp
    LOCAL_BIN_DIR=~/.local/bin
    NVIM_CONFIG_DIR=~/.config/nvim

    printf "Cloning repo to temp folder...\n"
    git clone https://github.com/aymxdd/dotfiles $TMP_DIR

    printf "Copying utils scripts...\n"
    mkdir -p $LOCAL_BIN_DIR
    cp -R $TMP_DIR/local/bin $LOCAL_BIN_DIR

    printf "Installing nvim config...\n"
    mkdir -p $NVIM_CONFIG_DIR
    cp -R $TMP_DIR/config/nvim $NVIM_CONFIG_DIR

    printf "Installing tmux config...\n"
    cp -R $TMP_DIR/tmux.conf ~/.tmux.conf

    printf "Cleaning up temp files...\n"
    rm -rf $TMP_DIR
fi

