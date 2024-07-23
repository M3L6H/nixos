{ config, lib, pkgs, ... }: {
  options = {
    toolchains.node.enable = lib.mkEnableOption "enables node toolchain";
  };

  config = lib.mkIf config.toolchains.node.enable {
    home.packages = with pkgs; [
      nodejs_22
    ];
  };
}

