{ config, inputs, lib, ... }: {
  options = {
    steam.enable = lib.mkEnableOption "enables steam module";
  };

  imports = [
    inputs.protontweaks.nixosModules.protontweaks
  ];

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;

    nixpkgs = {
      overlays = [
        inputs.protontweaks.overlay
      ];
    };

    services.protontweaks.enable = true;
  };
}

