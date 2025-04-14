{ config, lib, pkgs, ... }: {
  options = {
    nixos-rebuild-ng.enable = lib.mkEnableOption "enables nixos-rebuild-ng module";
  };

  config = lib.mkIf config.nixos-rebuild-ng.enable {
    environment.systemPackages = with pkgs; [
      nixos-rebuild-ng
    ];
  };
}

