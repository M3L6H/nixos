{ lib, ... }: {
  imports = [
    ./c-cpp.nix
    ./go.nix
    ./node.nix
    ./python.nix
  ];

  toolchains.c-cpp.enable = lib.mkDefault false;
  toolchains.go.enable = lib.mkDefault false;
  toolchains.node.enable = lib.mkDefault false;
  toolchains.python.enable = lib.mkDefault false;
}

