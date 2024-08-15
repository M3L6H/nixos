{ config, lib, pkgs, ... }: {
  options = {
    utils.wl-clipboard.enable = lib.mkEnableOption "enables wl-clipboard module";
  };

  config = lib.mkIf config.utils.wl-clipboard.enable {
    home.packages = [ pkgs.wl-clipboard ];
  };
}

