{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    utils.tectonic.enable = lib.mkEnableOption "enables tectonic module";
  };

  config = lib.mkIf config.utils.tectonic.enable {
    home.packages = with pkgs; [
      tectonic
    ];
  };
}
