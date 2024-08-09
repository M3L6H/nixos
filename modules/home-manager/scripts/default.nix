{ lib, ... }: {
  imports = [
    ./fs-diff.nix
    ./wallpaper-haven.nix
  ];

  scripts.wallpaper-haven.enable = lib.mkDefault false;
}

