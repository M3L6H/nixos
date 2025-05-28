{ lib, ... }:
{
  imports = [
    ./conditional-suspend.nix
    ./fs-diff.nix
    ./persist.nix
    ./toggle-mute.nix
    ./wallpaper-haven.nix
  ];

  config = {
    scripts.conditional-suspend.enable = lib.mkDefault false;
    scripts.wallpaper-haven.enable = lib.mkDefault false;

    home.sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
