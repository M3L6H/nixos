{ config, lib, ... }: {
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, F, exec, kitty"
          "$mainMod, D, exec, firefox"
          "$mainMod SHIFT, Q, exec, exit"
        ];
      };
    };
  };
}

