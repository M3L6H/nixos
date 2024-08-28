{ lib, ... }: {
  imports = [
    ./digikam
    ./bazecor.nix
    ./firefox.nix
    ./krita.nix
  ];

  software.digikam.enable = lib.mkDefault false;
  software.bazecor.enable = lib.mkDefault false;
  software.firefox.enable = lib.mkDefault false;
  software.krita.enable = lib.mkDefault false;
}

