{ config, lib, pkgs, username, ... }: {
  options = {
    software.bazecor.enable = lib.mkEnableOption "enables bazecor module";
  };

  config = lib.mkIf config.software.bazecor.enable {
    home.packages = with pkgs; [
      bazecor
    ];

    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".config/Bazecor"
      "Dygma"
    ];
  };
}

