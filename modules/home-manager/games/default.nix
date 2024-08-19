{ lib, ... }: {
  imports = [
    ./steam

    ./minecraft.nix
  ];

  config = {
    games.steam.enable = lib.mkDefault false;

    games.minecraft.enable = lib.mkDefault false;
  };
}

