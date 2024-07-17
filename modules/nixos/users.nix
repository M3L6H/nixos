{ config, lib, pkgs, ... }: {
  options = {
    users.enable = lib.mkEnableOption "enables users module";
  };

  config = lib.mkIf config.users.enable {
    environment.systemPackages = with pkgs; [
      home-manager
    ];

    users.users.m3l6h = {
      isNormalUser = true;
      description = "Michael Hollingworth";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };
  };
}
