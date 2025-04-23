{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      hyprshot
    ];

    wayland.windowManager.hyprland.settings.bind = [
      # Screenshot a window
      "$mainMod, PRINT, exec, hyprshot -m window"
      # Screenshot a monitor
      ", PRINT, exec, hyprshot -m output"
      # Screenshot a region
      "$mainMod SHIFT, PRINT, exec, hyprshot -m region"
    ];
  };
}

