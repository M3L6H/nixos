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

        # ssh files
        ".ssh"

        # audio files
        ".local/state/wireplumber"
      ];

      files = [
        # .gitconfig
        ".gitconfig"
      ];

      allowOther = true;
    };
  };
}

