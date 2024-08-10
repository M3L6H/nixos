{ lib, ... }: {
  imports = [
    ./digikam
    ./bazecor.nix
    ./firefox.nix
  ];

  software.digikam.enable = lib.mkDefault false;
  software.bazecor.enable = lib.mkDefault false;
  software.firefox.enable = lib.mkDefault false;
}

