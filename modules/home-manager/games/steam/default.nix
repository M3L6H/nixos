{ config, lib, username, ... }: {
  options = {
    games.steam.enable = lib.mkEnableOption "enables steam module";
  };

  imports = [
    ./factorio.nix
  ];

  config = lib.mkIf config.games.steam.enable {
    games.steam.factorio.enable = lib.mkDefault false;

    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".local/share/Steam"
    ];
  };
}

