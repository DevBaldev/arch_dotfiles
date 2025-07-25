#!/bin/bash

# Function to update the system
sys_update() {
  echo "Updating the system..."
  sudo pacman -Syu
}

# Function to install paru
paru_install() {
  echo "Installing paru..."
  git clone https://aur.archlinux.org/paru.git
  cd paru || exit
  makepkg -si --noconfirm
  cd .. || exit
  sudo rm -rf paru
}

# Function to install packages
pkgs_install() {
  echo "Installing applications..."
  # System
  paru -Sy --needed mesa vulkan-radeon
  # Fonts
  paru -Sy --needed noto-fonts-{cjk,emoji,extra} ttf-cascadia-code-nerd
  # Rusty
  paru -Sy --needed rust{,-analyzer} uutils-coreutils lsd bat zoxide ripgrep dua-cli
  # Yazi
  paru -Sy --needed yazi ffmpeg 7zip jq poppler fd fzf imagemagick
  # Theme
  paru -Sy --needed qt{5,6} nwg-look kvantum{,-qt5}
  paru -R qt{5,6}-tools
  # Desktop
  paru -Sy --needed hypr{land,paper,polkitagent} waybar mako kitty uwsm wofi
  # Media
  paru -Sy --needed imv mpv yt-dlp zathura-{cb,pdf-mupdf} obsidian spotify-launcher
  # LSP
  paru -Sy --needed {lua,bash}-language-server tombi pyright clang vscode-{css,html}-languageserver marksman
  # Formator
  paru -Sy --needed stylua shfmt ruff prettier
  # Aur
  paru -Sy --needed wofi-emoji ani-cli librewolf-bin
}

# Function to change the default shell to fish
change_shell() {
  echo "Changing default shell to fish..."
  paru -Sy --needed fish starship
  chsh -s "$(which fish)"
}

# Function to copy dotfiles to the user's home
dotfiles_copy() {
  echo "Copying dotfiles to home directory..."
  sudo rm -rf ../.git # Remove .git
  cp -r ../.* ~/      # Copy all dotfiles
}

# Main function to call all relevant functions
main() {
  sys_update
  paru_install
  pkgs_install
  change_shell
  dotfiles_copy
}

# Execute the main function
main
