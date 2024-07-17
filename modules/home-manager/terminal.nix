{ config, lib, pkgs, ... }: {
  options = {
    terminal.enable = lib.mkEnableOption "enables terminal module";
  };

  config = lib.mkIf config.terminal.enable {
    home.packages = with pkgs; [
      kitty
    ];
  };
}
