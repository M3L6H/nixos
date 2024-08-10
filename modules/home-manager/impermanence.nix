{ config, inputs, lib, pkgs, username, ... }: {
  options = {
    impermanence.enable = lib.mkEnableOption "enables impermanence module";
  };

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  config = lib.mkIf config.impermanence.enable {
    home.persistence."/persist/home/${username}" = {
      directories = [
        # firefox
        ".mozilla/firefox"

        # kde settings

        # ssh files
        ".ssh"
      ];

      files = [
        # kde display settings
        ".config/kwinoutputconfig.json"
        ".config/plasma-org.kde.plasma.desktop-appletsrc"
        ".local/share/systemsettings/systemsettingsstaterc"

        # .gitconfig
        ".gitconfig"
      ];

      allowOther = true;
    };
  };
}

