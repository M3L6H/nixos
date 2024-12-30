{ config, lib, pkgs, ... }: {
  options = {
    toolchains.c-cpp.enable = lib.mkEnableOption "enables c/c++ module";
  };

  config = lib.mkIf config.toolchains.c-cpp.enable {
    home.packages = with pkgs; [
      cmake
      gcc14
      gnumake
    ];
  };
}

