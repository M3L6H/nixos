{ config, lib, pkgs, ... }: {
  options = {
    c-cpp.enable = lib.mkEnableOption "enables c/c++ module";
  };

  config = lib.mkIf config.c-cpp.enable {
    home.packages = with pkgs; [
      gcc14
      gnumake
    ];
  };
}

