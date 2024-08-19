{ config, lib, username, ... }: {
  options = {
    games.steam.enable = lib.mkEnableOption "enables steam module";
  };

  imports = [
    ./factorio.nix
  ];

  config = lib.mkIf config.games.steam.enable {
    games.steam.factorio.enable = lib.mkDefault false;

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        {
          directory = ".local/share/Steam";
          method = "symlink";
        }

        ".steam"
      ];

      files = [
        ".local/share/icons/hicolor/16x16/apps/steam_icon_427520.png"
        ".local/share/icons/hicolor/32x32/apps/steam_icon_427520.png"
        ".local/share/icons/hicolor/48x48/apps/steam_icon_427520.png"
      ];
    };
  };
}

