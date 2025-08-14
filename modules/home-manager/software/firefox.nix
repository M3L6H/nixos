{
  config,
  lib,
  pkgs,
  username,
  ...
}:
{
  options = {
    software.firefox.enable = lib.mkEnableOption "enables firefox module";
  };

  config = lib.mkIf config.software.firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-esr;
    };

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".mozilla/firefox"
      ];

      allowOther = false;
    };
  };
}
