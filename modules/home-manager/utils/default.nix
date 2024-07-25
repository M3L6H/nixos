{ lib, ... }: {
  imports = [
    ./file.nix
    ./fzf.nix
    ./image-magick.nix
    ./jq.nix
    ./parted.nix
    ./ripgrep.nix
    ./unzip.nix
  ];

  utils.file.enable = lib.mkDefault false;
  utils.fzf.enable = lib.mkDefault false;
  utils.image-magick.enable = lib.mkDefault false;
  utils.jq.enable = lib.mkDefault false;
  utils.ripgrep.enable = lib.mkDefault false;
  utils.parted.enable = lib.mkDefault false;
  utils.unzip.enable = lib.mkDefault false;
}

