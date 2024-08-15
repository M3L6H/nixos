{ config, lib, pkgs, ... }: {
  options = {
    utils.ffmpeg.enable = lib.mkEnableOption "enables ffmpeg module";
  };

  config = lib.mkIf config.utils.ffmpeg.enable {
    home.packages = with pkgs; [
      ffmpeg-full
    ];
  };
}

