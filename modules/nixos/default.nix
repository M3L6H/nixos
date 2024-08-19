{ lib, ... }: {
  imports = [
    ./hyprland.nix
    ./impermanence.nix
    ./mounts.nix
    ./nix-ld.nix
    ./nvidia.nix
    ./partition-manager.nix
    ./sddm.nix
    ./steam.nix
    ./users.nix
    ./vcs.nix
  ];

  config.hyprland.enable = lib.mkDefault true;
  config.impermanence.enable = lib.mkDefault true;
  config.mounts.enable = lib.mkDefault false;
  config.nix-ld.enable = lib.mkDefault true;
  config.nvidia.enable = lib.mkDefault false;
  config.partition-manager.enable = lib.mkDefault false;
  config.sddm.enable = lib.mkDefault true;
  config.steam.enable = lib.mkDefault false;
  config.users.enable = lib.mkDefault true;
  config.vcs.enable = lib.mkDefault true;
}

