{ lib, ... }:
{
  imports = [
    ./minecraft.nix
  ];

  config = {
    games.minecraft.enable = lib.mkDefault false;
  };
}
