{ config, lib, pkgs, ... }: {
  options = {
    utils.unzip.enable = lib.mkEnableOption "enables unzip module";
  };

  config = lib.mkIf config.utils.unzip.enable {
    home.packages = with pkgs; [
      unzip
    ];
  };
}

