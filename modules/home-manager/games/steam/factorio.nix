{ config, lib, username, ... }: {
  options = {
    games.steam.factorio.enable = lib.mkEnableOption "enables factorio module";
  };

  config = lib.mkIf config.games.steam.factorio.enable {
    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".factorio"
      ];

      files = [
        ".local/share/applications/Factorio.desktop"
      ];
    };
  };
}

