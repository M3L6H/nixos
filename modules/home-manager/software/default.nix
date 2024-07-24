{ lib, ... }: {
  imports = [
    ./bazecor.nix
  ];

  software.bazecor.enable = lib.mkDefault false;
}

