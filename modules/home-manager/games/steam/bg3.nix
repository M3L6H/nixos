{ config, lib, username, ... }: {
  options = {
    games.steam.bg3.enable = lib.mkEnableOption "enables baldur's gate 3 module";
  };

  config = lib.mkIf config.games.steam.factorio.enable {
    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      files = [
        # ".local/share/applications/Baldur\\'s\\ Gate\\ 3.desktop"
      ];
    };
  };
}

