{ lib, ... }: {
  imports = [
    ./hyprland
    ./neovim
    ./scripts
    ./software
    ./toolchains
    ./utils
    ./aliases.nix
    ./impermanence.nix
    ./user-dirs.nix
    ./terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  hyprland.enable = lib.mkDefault false;
  impermanence.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault false;
  user-dirs.enable = lib.mkDefault false;
  terminal.enable = lib.mkDefault false;
  tmux.enable = lib.mkDefault false;
  zsh.enable = lib.mkDefault false;
}

