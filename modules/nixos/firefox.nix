{ config, lib, pkgs, ... }: {
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox module";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox.enable = true;

    environment.sessionVariables = {
      # Prevent firefox crashes with: Error reading events from display
      MOZ_ENABLE_WAYLAND = "0";
    };
  };
}

