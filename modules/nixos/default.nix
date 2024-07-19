{ lib, ... }: {
  imports = [
    ./users.nix
    ./vcs.nix
  ];

  config.users.enable = lib.mkDefault true;
  config.vcs.enable = lib.mkDefault true;
}
