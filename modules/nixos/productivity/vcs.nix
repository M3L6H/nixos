{ config, lib, pkgs, ... }: {
  options = {
    vcs.enable = lib.mkEnableOption "enables vcs module";
  };

  config = lib.mkIf config.vcs.enable {
    environment.systemPackages = with pkgs; [
      git
    ];
  };
}
