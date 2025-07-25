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

  # Network
  paru -Sy --needed network-manager-applet

  # Audio
  paru -Sy --needed pipewire pipewire-pulse wireplumber pipewire-jack \
    pavucontrol-qt bluez bluez-tools blueman

  # Fonts
  paru -Sy --needed noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
    ttf-cascadia-code-nerd ttf-jetbrains-mono-nerd

  # CLI Tools
  paru -Sy --needed rust uutils-coreutils lsd bat zoxide ripgrep \
    dua-cli yazi ffmpeg 7zip jq poppler fd fzf imagemagick btop

  # UI/Theme
  paru -Sy --needed qt5 qt6 nwg-look kvantum kvantum-qt5
  paru -R qt5-tools qt6-tools

  # Desktop
  paru -Sy --needed hyprland hyprpaper hyprpolkitagent waybar mako \
    kitty uwsm wofi
  # Media
  paru -Sy --needed imv mpv yt-dlp zathura-cb zathura-pdf-mupdf \
    obsidian spotify-launcher

  # LSP/Formator
  paru -Sy --needed lua-language-server tombi python-lsp-server \
    rust-analyzer stylua ruff

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
  cp -r ./.* ~/      # Copy all dotfiles
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
