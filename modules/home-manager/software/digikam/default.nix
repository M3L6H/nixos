{ config, lib, pkgs, username, ... }: {
  options = {
    software.digikam.enable = lib.mkEnableOption "enables digikam module";
  };

  config = lib.mkIf config.software.digikam.enable {
    home.packages = with pkgs; [
      digikam
      exiftool
    ];

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".local/share/digikam"
        "digikam"
      ];

      files = [
        ".config/digikam_systemrc"
        ".config/digikamrc"
      ];
    };
  };
}

