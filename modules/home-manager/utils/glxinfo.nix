{ config, lib, pkgs, ... }: {
  options = {
    utils.glxinfo.enable = lib.mkEnableOption "enables glxinfo module";
  };

  config = lib.mkIf config.utils.glxinfo.enable {
    home.packages = with pkgs; [
      glxinfo
    ];
  };
}

