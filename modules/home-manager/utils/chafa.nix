{ config, lib, pkgs, ... }: {
  options = {
    utils.chafa.enable = lib.mkEnableOption "enables chafa module";
  };

  config = lib.mkIf config.utils.chafa.enable {
    home.packages = with pkgs; [
      chafa
    ];
  };
}

