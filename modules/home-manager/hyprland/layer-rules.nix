{ config, lib, ... }:
{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "layerrule" = [
        "blur, eww-bar"
        "ignorezero, eww-bar"
      ];
    };
  };
}
