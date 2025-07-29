{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    utils.expect.enable = lib.mkEnableOption "enables expect module";
  };

  config = lib.mkIf config.utils.file.enable {
    home.packages = with pkgs; [
      expect
    ];
  };
}
