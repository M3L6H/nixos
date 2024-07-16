{ lib, ... }: {
  imports = [
    ./editor.nix
    ./vcs.nix
  ];

  editor.enable = lib.mkDefault true;
  vcs.enable = lib.mkDefault true;
}
