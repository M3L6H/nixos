{ config, lib, pkgs, username, ... }: {
  options = {
    games.steam.enable = lib.mkEnableOption "enables steam module";
  };

  imports = [
    ./bg3.nix
    ./factorio.nix
  ];

  config = lib.mkIf config.games.steam.enable {
    games.steam.bg3.enable = lib.mkDefault false;
    games.steam.factorio.enable = lib.mkDefault false;

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".config/steamtinkerlaunch"
        ".local/share/Steam"
      ];
    };

    # We install proton GE imperatively with protonup b/c Steam will update its
    # components anyway
    # Install with protonup
    home.packages = with pkgs; [
      protonup
    ];
  };
}

