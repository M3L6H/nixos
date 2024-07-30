{ config, lib, pkgs, ... }: {
  options = {
    sddm.enable = lib.mkEnableOption "enables sddm module";
  };

  config = lib.mkIf config.sddm.enable {
    services.displayManager.sddm.enable = true;

    services.displayManager.defaultSession = "plasma";
  };
}

