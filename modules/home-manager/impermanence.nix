{ config, inputs, lib, username, ... }: {
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
      ];

      files = [
        # .gitconfig
        ".gitconfig"

        # Audio
        ".local/state/wireplumber/default-nodes"
        ".local/state/wireplumber/default-routes"
        ".local/state/wireplumber/stream-properties"
      ];

      allowOther = true;
    };
  };
}

