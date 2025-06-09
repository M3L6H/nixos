{ config, lib, ... }:
{
  options = {
    scripts.conditional-lock.enable = lib.mkEnableOption "enables conditional-lock module";
  };

  config = lib.mkIf config.scripts.conditional-lock.enable {
    home.file.".local/bin/conditional-lock" = {
      executable = true;
      source = ./conditional-lock.sh;
    };
  };
}
