{ config, lib, pkgs, ... }: {
  options = {
    toolchains.python.enable = lib.mkEnableOption "enables python toolchain";
  };

  config = lib.mkIf config.toolchains.python.enable {
    home.packages = with pkgs; [
      python3
    ];
  };
}

