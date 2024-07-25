{ config, lib, pkgs, ... }: {
  options = {
    utils.parted.enable = lib.mkEnableOption "enables parted module";
  };

  config = lib.mkIf config.utils.parted.enable {
    home.packages = with pkgs; [
      parted
    ];
  };
}

