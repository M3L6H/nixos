{ lib, ... }: {
  imports = [
    ./c-cpp.nix
  ];

  c-cpp.enable = lib.mkDefault true;
}

