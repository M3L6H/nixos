{ config, lib, ... }:
{
  options = {
    sddm.enable = lib.mkEnableOption "enables sddm module";
  };

  config = lib.mkIf config.sddm.enable {
    programs.uwsm.enable = true;

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    services.displayManager.defaultSession = "hyprland-uwsm";
  };
}
