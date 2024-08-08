{ config, inputs, lib, pkgs, ... }: {
  options = {
    impermanence.enable = lib.mkEnableOption "enables impermanence module";
  };

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  config = lib.mkIf config.impermanence.enable {
    home.persistence."/persist/home" = {
      files = [
        # ssh files
	".ssh/id_ed25519"
	".ssh/id_ed25519.pub"
        ".ssh/known_hosts"
      ];
    };
  };
}

