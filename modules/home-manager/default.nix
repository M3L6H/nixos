{ lib, ... }: {
  imports = [
    ./games
    ./hyprland
    ./neovim
    ./scripts
    ./software
    ./toolchains
    ./utils
    ./zsh

    ./aliases.nix
    ./gpg.nix
    ./impermanence.nix
    ./user-dirs.nix
    ./terminal.nix
    ./tmux.nix
  ];

  hyprland.enable = lib.mkDefault false;
  neovim.enable = lib.mkDefault false;
  zsh.enable = lib.mkDefault false;

  gpg.enable = lib.mkDefault false;
  impermanence.enable = lib.mkDefault true;
  user-dirs.enable = lib.mkDefault false;
  terminal.enable = lib.mkDefault false;
  tmux.enable = lib.mkDefault false;
}

