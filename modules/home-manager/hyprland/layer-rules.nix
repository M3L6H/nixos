{ config, lib, ... }:
{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "layerrule" = [
        "blur, gtk-layer-shell"
      ];
    };
  };
}
