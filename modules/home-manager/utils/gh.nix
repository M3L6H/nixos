{
  config,
  lib,
  pkgs,
  username,
  ...
}:
{
  options = {
    utils.gh.enable = lib.mkEnableOption "enables gh module";
  };

  config = lib.mkIf config.utils.gh.enable {
    home.packages = with pkgs; [
      gh
    ];

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".config/gh"
      ];

      allowOther = false;
    };
  };
}
