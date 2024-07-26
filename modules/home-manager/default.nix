{ lib, ... }: {
  imports = [
    ./hyprland
    ./neovim
    ./scripts
    ./software
    ./toolchains
    ./utils
    ./aliases.nix
    ./user-dirs.nix
    ./terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  hyprland.enable = lib.mkDefault false;
  neovim.enable = lib.mkDefault false;
  user-dirs.enable = lib.mkDefault false;
  terminal.enable = lib.mkDefault false;
  tmux.enable = lib.mkDefault false;
  zsh.enable = lib.mkDefault false;
}

