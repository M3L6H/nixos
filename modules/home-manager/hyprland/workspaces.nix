{ config, lib, ... }: {
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "workspace" = [
        "1, monitor:DP-1"
        "2, monitor:DP-2"
        "3, monitor:HDMI-A-1"
      ];

      "windowrule" = [
        "workspace 1, steam"
        "workspace 2, kitty"
        "workspace 3, vivaldi"
      ];
    };
  };
}

