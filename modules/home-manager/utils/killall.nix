{ config, lib, pkgs, ... }: {
  options = {
    utils.killall.enable = lib.mkEnableOption "enables killall module";
  };

  config = lib.mkIf config.utils.killall.enable {
    home.packages = with pkgs; [
      killall
    ];
  };
}

