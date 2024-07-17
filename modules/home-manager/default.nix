{ lib, ... }: {
  imports = [
    ./terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  terminal.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
