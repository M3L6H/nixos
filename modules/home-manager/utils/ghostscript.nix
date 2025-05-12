{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    utils.ghostscript.enable = lib.mkEnableOption "enables ghostscript module";
  };

  config = lib.mkIf config.utils.ghostscript.enable {
    home.packages = with pkgs; [
      ghostscript
    ];
  };
}
