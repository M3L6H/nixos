{ config, lib, pkgs, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland module";
  };

  imports = [
    ./binds.nix
    ./monitors.nix
  ];

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      systemd.variables = [ "--all" ];
    };
  };
}

