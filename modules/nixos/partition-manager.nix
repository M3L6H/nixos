{ config, lib, ... }: {
  options = {
    partition-manager.enable = lib.mkEnableOption "enables partition-manager module";
  };

  config = lib.mkIf config.partition-manager.enable {
    programs.partition-manager.enable = true;
  };
}

