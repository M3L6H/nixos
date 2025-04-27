{ config, lib, pkgs, ... }: {
  options = {
    utils.bat.enable = lib.mkEnableOption "enables bat module";
  };

  config = lib.mkIf config.utils.bat.enable {
    home.packages = with pkgs; [
      bat
    ];
  };
}

