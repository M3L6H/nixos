{ lib, ... }: {
  imports = [
    ./productivity/bundle.nix
    ./users.nix
  ];

  config.users.enable = lib.mkDefault true;
}
