{ lib, ... }: {
  imports = [
    ./hyprland.nix
    ./nix-ld.nix
    ./users.nix
    ./vcs.nix
  ];

  config.hyprland.enable = lib.mkDefault true;
  config.nix-ld.enable = lib.mkDefault true;
  config.users.enable = lib.mkDefault true;
  config.vcs.enable = lib.mkDefault true;
}

