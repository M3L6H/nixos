{ config, lib, ... }: {
  options = {
    steam.enable = lib.mkEnableOption "enables steam module";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}

