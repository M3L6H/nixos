{ config, lib, pkgs, username, ... }: {
  options = {
    gpg.enable = lib.mkEnableOption "enables gpg module";
  };

  config = lib.mkIf config.gpg.enable {
    home.packages = with pkgs; [
      pinentry-qt
    ];

    programs.gpg = {
      enable = true;
      mutableKeys = true;
      mutableTrust = true;
    };

    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".gnupg"
      ];
    };
  };
}

