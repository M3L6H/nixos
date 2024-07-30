{ config, lib, pkgs, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland module";
  };

  imports = [
    ./binds.nix
  ];

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        "monitor" = ",preferred,auto,1";
      };

      systemd.variables = [ "--all" ];
    };
  };
}

