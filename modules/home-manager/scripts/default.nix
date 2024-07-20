{ lib, ... }: {
  imports = [
    ./wallpaper-haven.nix
  ];

  scripts.wallpaper-haven.enable = lib.mkDefault false;
}

