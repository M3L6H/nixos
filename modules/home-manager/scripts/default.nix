{ lib, ... }: {
  imports = [
    ./fs-diff.nix
    ./persist.nix
    ./toggle-mute.nix
    ./wallpaper-haven.nix
  ];

  scripts.wallpaper-haven.enable = lib.mkDefault false;
}

