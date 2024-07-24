{ lib, ... }: {
  imports = [
    ./scripts
    ./software
    ./toolchains
    ./utils
    ./aliases.nix
    ./neovim
    ./user-dirs.nix
    ./terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  neovim.enable = lib.mkDefault false;
  user-dirs.enable = lib.mkDefault false;
  terminal.enable = lib.mkDefault false;
  tmux.enable = lib.mkDefault false;
  zsh.enable = lib.mkDefault false;
}
