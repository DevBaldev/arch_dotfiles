#!/bin/bash

sys_update() {
  sudo pacman -Syu
}

paru_install() {
  git clone https://aur.archlinux.org/paru.git && cd paru || exit
  makepkg -si --noconfirm
  cd .. && sudo rm -rf paru
}

install_pkgs() {
  paru -Sy --needed "$@"
}

uninstall_pkgs() {
  paru -R "$@"
}

pkgs_install() {
  install_pkgs mesa vulkan-radeon
  install_pkgs pipewire{,-{pulse,jack}} wireplumber
  install_pkgs noto-fonts-{cjk,emoji,extra} ttf-{cascadia-code,jetbrains-mono}-nerd
  install_pkgs hypr{land,paper,polkitagent} waybar mako ghostty wofi
  install_pkgs qt{5,6} nwg-look kvantum{,-qt5} qt6ct
  uninstall_pkgs qt{5,6}-tools
  install_pkgs rust uutils-coreutils lsd bat zoxide ripgrep dua-cli yazi ffmpeg 7zip jq poppler fd fzf imagemagick btop
  install_pkgs imv mpv yt-dlp zathura-{cb,pdf-mupdf}
  install_pkgs {{bash,lua}-language,python-lsp}-server tombi rust-analyzer stylua ruff shfmt
  install_pkgs network-manager-applet blueman pavucontrol-qt bluez{,-tools}
  install_pkgs obsidian spotify-launcher
  install_pkgs wofi-emoji ani-cli {librewolf,freetube}-bin
  install_pkgs catppuccin-gtk-theme-mocha tela-circle-icon-theme-dracula bibata-cursor-theme-bin
}

change_shell() {
  install_pkgs fish starship
  chsh -s "$(which fish)"
}

dotfiles_copy() {
  sudo rm -rf ./.git
  cp -r ./.* ~/
}

main() {
  sys_update
  paru_install
  pkgs_install
  change_shell
  dotfiles_copy
}

main
