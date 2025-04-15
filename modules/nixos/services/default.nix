{ lib, ... }: {
  imports = [
    ./clean-old-generations.nix
  ];

  config.services.clean-old-generations.enable = lib.mkDefault true;
}

