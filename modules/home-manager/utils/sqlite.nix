{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    utils.sqlite.enable = lib.mkEnableOption "enables sqlite module";
  };

  config = lib.mkIf config.utils.sqlite.enable {
    home.packages = with pkgs; [
      sqlite
      sqlitecpp # sqlite lib
    ];
  };
}
