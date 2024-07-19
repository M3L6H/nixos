{ config, lib, pkgs, ... }: {
  options = {
    fzf.enable = lib.mkEnableOption "enables fzf module";
  };

  config = lib.mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
    };
  };
}

