{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    utils.socat.enable = lib.mkEnableOption "enables socat module";
  };

  config = lib.mkIf config.utils.socat.enable {
    home.packages = with pkgs; [
      socat
    ];
  };
}
