{ config, lib, pkgs, ... }: {
  options = {
    toolchains.markdown.enable = lib.mkEnableOption "enables markdown toolchain";
  };

  config = lib.mkIf config.toolchains.markdown.enable {
    home.packages = with pkgs; [
      marksman
    ];
  };
}

