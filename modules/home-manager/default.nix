{ lib, ... }: {
  imports = [
    ./scripts
    ./toolchains
    ./utils
    ./aliases.nix
    ./neovim
    ./terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  neovim.enable = lib.mkDefault false;
  terminal.enable = lib.mkDefault false;
  tmux.enable = lib.mkDefault false;
  zsh.enable = lib.mkDefault false;
}
