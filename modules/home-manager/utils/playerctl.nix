{ config, lib, pkgs, ... }: {
  options = {
    utils.playerctl.enable = lib.mkEnableOption "enables playerctl module";
  };

  config = lib.mkIf config.utils.playerctl.enable {
    home.packages = with pkgs; [
      playerctl
    ];

    services.playerctld.enable = true;
  };
}

