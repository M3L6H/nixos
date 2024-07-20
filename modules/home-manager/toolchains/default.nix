{ lib, ... }: {
  imports = [
    ./c-cpp.nix
    ./python.nix
  ];

  toolchains.c-cpp.enable = lib.mkDefault false;
  toolchains.python.enable = lib.mkDefault false;
}

