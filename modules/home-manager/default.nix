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

  neovim.enable = lib.mkDefault true;
  terminal.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
