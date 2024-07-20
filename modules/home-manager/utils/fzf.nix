{ config, lib, pkgs, ... }: {
  options = {
    utils.fzf.enable = lib.mkEnableOption "enables fzf module";
  };

  config = lib.mkIf config.utils.fzf.enable {
    programs.fzf = {
      enable = true;
    };
  };
}

