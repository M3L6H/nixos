{
  config,
  lib,
  username,
  ...
}:
{
  options = {
    services.clip-mngr.enable = lib.mkEnableOption "enables clipboard manager (clipse) module";
  };

  config = lib.mkIf config.services.clip-mngr.enable {
    services.clipse = {
      enable = true;
      historySize = 200;
      imageDisplay = {
        type = "kitty";
      };
    };

    wayland.windowManager.hyprland.settings = {
      bind = [
        "$mainMod SHIFT, C, exec, kitty --class clipse -e 'clipse'"
      ];
      windowrule = [
        "float, class:(clipse)"
        "size 622 652, class:(clipse)"
      ];
    };

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".config/clipse"
      ];
    };
  };
}
