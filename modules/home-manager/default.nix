{ lib, ... }: {
  imports = [
    ./toolchains
    ./aliases.nix
    ./fzf.nix
    ./neovim
    ./terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  fzf.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  terminal.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
