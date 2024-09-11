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
        ".local/share/Steam"
        ".steam-compatibility-tools"
      ];
    };

    # We install proton GE imperatively with protonup b/c Steam will update its
    # components anyway
    # Install with protonup -d $HOME/.steam-compatibility-tools
    home.packages = with pkgs; [
      protonup
    ];

    # Inform steam where proton will be installed
    home.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =  "/home/${username}/.steam-compatibility-tools";
    };
  };
}

