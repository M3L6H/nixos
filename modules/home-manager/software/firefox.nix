{ config, lib, pkgs, username, ... }: {
  options = {
    software.firefox.enable = lib.mkEnableOption "enables firefox module";
  };

  config = lib.mkIf config.software.firefox.enable {
    programs.firefox.enable = true;

    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".mozilla/firefox"
    ];
  };
}

