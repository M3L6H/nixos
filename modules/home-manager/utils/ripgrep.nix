{ config, lib, ... }: {
  options = {
    utils.ripgrep.enable = lib.mkEnableOption "enables ripgrep module";
  };

  config = lib.mkIf config.utils.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}

