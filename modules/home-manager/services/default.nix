{ lib, ... }:
{
  imports = [
    ./clip-mngr.nix
  ];

  services.clip-mngr.enable = lib.mkDefault false;
}
