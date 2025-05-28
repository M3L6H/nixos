{ config, lib, ... }:
{
  options = {
    scripts.conditional-suspend.enable = lib.mkEnableOption "enables conditional-suspend module";
  };

  config = lib.mkIf config.scripts.conditional-suspend.enable {
    home.file.".local/bin/conditional-suspend" = {
      executable = true;
      source = ./conditional-suspend.sh;
    };
  };
}
