{ config, lib, pkgs, ... }: {
  options = {
    utils.iw.enable = lib.mkEnableOption "enables iw module";
  };

  config = lib.mkIf config.utils.iw.enable {
    home.packages = with pkgs; [
      iw
    ];
  };
}

