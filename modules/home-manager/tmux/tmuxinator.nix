{ config, lib, pkgs, username, ... }: {
  options = {
    tmux.tmuxinator.enable = lib.mkEnableOption "enables tmuxinator util";
  };

  config = lib.mkIf config.tmux.tmuxinator.enable {
    home.packages = with pkgs; [
      tmuxinator
    ];

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".config/tmuxinator"
      ];
    };
  };
}

