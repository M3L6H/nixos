{ config, lib, pkgs, ... }: {
  options = {
    utils.lsof.enable = lib.mkEnableOption "enables lsof module";
  };

  config = lib.mkIf config.utils.lsof.enable {
    home.packages = with pkgs; [
      lsof
    ];
  };
}

