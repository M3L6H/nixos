{ config, lib, pkgs, ... }: {
  options = {
    utils.jq.enable = lib.mkEnableOption "enables jq module";
  };

  config = lib.mkIf config.utils.jq.enable {
    programs.jq = {
      enable = true;
    };
  };
}

