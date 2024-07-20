{ config, lib, pkgs, ... }: {
  options = {
    utils.image-magick.enable = lib.mkEnableOption "enables image-magick module";
  };

  config = lib.mkIf config.utils.image-magick.enable {
    home.packages = with pkgs; [
      imagemagick
    ];
  };
}

