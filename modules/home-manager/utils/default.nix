{ lib, ... }: {
  imports = [
    ./fzf.nix
    ./ripgrep.nix
  ];

  fzf.enable = lib.mkDefault true;
  ripgrep.enable = lib.mkDefault true;
}

