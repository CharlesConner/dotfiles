#!/bin/bash

source 'scripts/helpers.sh'

ZSHRC=$HOME/.zshrc
OH_MY_ZSH=$HOME/.oh-my-zsh

echo_header "ZSH Configuration"

if exists "zsh"; then
  if [[ -f "$ZSHRC" || -L "$ZSHRC" ]]; then
    echo_item "~/.zshrc already exists" "green"
  else
    ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
    echo_item "Symlinking zshrc" "green"
  fi
  if [[ -d  "$OH_MY_ZSH" ]]; then
    echo_item "Oh my zsh is already installed" "green"
  else
    if exists "curl"; then
      curl -L http://install.ohmyz.sh | sh
    elif exists "wget"; then
      wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    else
      echo_item "You need either curl or wget installed to download Oh My ZSH" "red"
    fi
  fi
else
  echo_item "ZSH is not installed" "red"
fi

echo ""

