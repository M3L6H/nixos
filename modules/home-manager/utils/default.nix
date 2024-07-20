{ lib, ... }: {
  imports = [
    ./file.nix
    ./fzf.nix
    ./image-magick.nix
    ./jq.nix
    ./ripgrep.nix
  ];

  utils.file.enable = lib.mkDefault false;
  utils.fzf.enable = lib.mkDefault false;
  utils.image-magick.enable = lib.mkDefault false;
  utils.jq.enable = lib.mkDefault false;
  utils.ripgrep.enable = lib.mkDefault false;
}
