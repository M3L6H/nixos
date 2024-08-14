{ lib, ... }: {
  imports = [
    ./c-cpp.nix
    ./go.nix
    ./markdown.nix
    ./nix.nix
    ./node.nix
    ./python.nix
  ];

  toolchains.c-cpp.enable = lib.mkDefault false;
  toolchains.go.enable = lib.mkDefault false;
  toolchains.markdown.enable = lib.mkDefault false;
  toolchains.nix.enable = lib.mkDefault true;
  toolchains.node.enable = lib.mkDefault false;
  toolchains.python.enable = lib.mkDefault false;
}

