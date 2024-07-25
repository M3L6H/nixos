{ lib, ... }: {
  imports = [
    ./hyprland.nix
    ./mounts.nix
    ./nix-ld.nix
    ./partition-manager.nix
    ./users.nix
    ./vcs.nix
  ];

  config.hyprland.enable = lib.mkDefault true;
  config.mounts.enable = lib.mkDefault false;
  config.nix-ld.enable = lib.mkDefault true;
  config.partition-manager.enable = lib.mkDefault false;
  config.users.enable = lib.mkDefault true;
  config.vcs.enable = lib.mkDefault true;
}

