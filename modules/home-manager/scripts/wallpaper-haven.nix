{ config, lib, ... }: {
  options = {
    scripts.wallpaper-haven.enable = lib.mkEnableOption "enables wallpaper haven module";
  };

  config = lib.mkIf config.scripts.wallpaper-haven.enable {
    # We use jq for parsing the result of the wallhaven api
    utils.jq.enable = true;

    # We use image-magick for converting jpg into png
    utils.image-magick.enable = true;

    home.file.".local/bin/wallpaper-haven" = {
      executable = true;
      source = ./wallpaper-haven.sh;
    };

    home.shellAliases.wp-random = "$HOME/.local/bin/wallpaper-haven";
  };
}

