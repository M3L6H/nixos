{ config, lib, pkgs, ... }: {
  options = {
    toolchains.nix.enable = lib.mkEnableOption "enables nix toolchain";
  };

  config = lib.mkIf config.toolchains.nix.enable {
    home.packages = with pkgs; [
      nil
    ];
  };
}

