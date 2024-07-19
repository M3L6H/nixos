{ config, lib, pkgs, ... }: {
  options = {
    ripgrep.enable = lib.mkEnableOption "enables ripgrep module";
  };

  config = lib.mkIf config.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}

