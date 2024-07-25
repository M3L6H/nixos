{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home.stateVersion = "24.05";

  home.username = "m3l6h";
  home.homeDirectory = "/home/m3l6h";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable neovim
  neovim.enable = true;

  # Enable kitty
  terminal.enable = true;

  # Enable tmux
  tmux.enable = true;

  # Enable managed user dirs
  user-dirs.enable = true;

  # Enable zsh
  zsh.enable = true;

  # Enable wallpaper haven script
  scripts.wallpaper-haven.enable = true;

  # Enable bazecor
  software.bazecor.enable = true;

  # Enable file util
  utils.file.enable = true;

  # Enable parted util
  utils.parted.enable = true;
}

