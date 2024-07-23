{ config, lib, pkgs, ... }: {
  options = {
    toolchains.go.enable = lib.mkEnableOption "enables go toolchain";
  };

  config = lib.mkIf config.toolchains.go.enable {
    home.packages = with pkgs; [
      go
    ];
  };
}

