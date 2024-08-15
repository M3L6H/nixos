{ config, lib, username, ... }: {
  config = lib.mkIf config.hyprland.enable {
    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".cache/swww"
    ];
  };
}

