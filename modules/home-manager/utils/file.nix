{ config, lib, pkgs, ... }: {
  options = {
    utils.file.enable = lib.mkEnableOption "enables file module";
  };

  config = lib.mkIf config.utils.file.enable {
    home.packages = with pkgs; [
      file
    ];
  };
}

