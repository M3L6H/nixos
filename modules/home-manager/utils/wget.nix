{ config, lib, pkgs, ... }: {
  options = {
    utils.wget.enable = lib.mkEnableOption "enables wget module";
  };

  config = lib.mkIf config.utils.wget.enable {
    home.packages = with pkgs; [
      wget
    ];
  };
}

