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

  # Audio
  paru -Sy --needed pipewire{,-{pulse,jack}} wireplumber

  # Fonts
  paru -Sy --needed noto-fonts-{cjk,emoji,extra} ttf-{cascadia-code,jetbrains-mono}-nerd

  # Desktop
  paru -Sy --needed hypr{land,paper,polkitagent} waybar mako kitty wofi

  # UI/Theme tools
  paru -Sy --needed qt{5,6} nwg-look kvantum{,-qt5} qt6ct
  paru -R qt{5,6}-tools

  # CLI Tools
  paru -Sy --needed rust uutils-coreutils lsd bat zoxide ripgrep dua-cli yazi ffmpeg 7zip jq poppler fd fzf imagemagick btop

  # Media
  paru -Sy --needed imv mpv yt-dlp zathura-{cb,pdf-mupdf} 

  # LSP/Formator
  paru -Sy --needed {lua-language,python-lsp}-server tombi rust-analyzer stylua ruff

  # Network/Bluetooth
  paru -Sy --needed network-manager-applet blueman pavucontrol-qt bluez{,-tools}

  # NOT FOSS
  oparu -Sy --needed bsidian spotify-launcher

  # Aur
  paru -Sy --needed wofi-emoji ani-cli {librewolf,freetube}-bin

  # themes
  paru -Sy --needed catppuccin-gtk-theme-mocha tela-circle-icon-theme-dracula bibata-cursor-theme-bin
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
  sudo rm -rf ./.git # Remove .git
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
