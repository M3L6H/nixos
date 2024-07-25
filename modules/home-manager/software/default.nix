{ lib, ... }: {
  imports = [
    ./digikam
    ./bazecor.nix
  ];

  software.digikam.enable = lib.mkDefault false;
  software.bazecor.enable = lib.mkDefault false;
}

