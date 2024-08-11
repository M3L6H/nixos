{ config, lib, ... }: {
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "monitor" = [
        "DP-1, 1920x1080, 0x0, 1"
        "DP-2, 3840x2160, 1920x0, 2"
        "HDMI-A-1, 1920x1080, 3840x0, 1"
      ];
    };
  };
}

