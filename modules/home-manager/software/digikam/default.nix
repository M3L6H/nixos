{ config, lib, pkgs, ... }: {
  options = {
    software.digikam.enable = lib.mkEnableOption "enables digikam module";
  };

  config = lib.mkIf config.software.digikam.enable {
    home.packages = with pkgs; [
      digikam
    ];
  };
}

