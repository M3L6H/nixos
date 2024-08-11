{ config, lib, ... }: {
  config = lib.mkIf config.hyprland.enable {
    home.file.".config/rofi/config.rasi" = {
      source = ./config.rasi;
    };
  };
}

