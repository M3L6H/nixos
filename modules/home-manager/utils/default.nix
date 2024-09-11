{ lib, ... }: {
  imports = [
    ./ffmpeg.nix
    ./file.nix
    ./fzf.nix
    ./glxinfo.nix
    ./image-magick.nix
    ./jq.nix
    ./parted.nix
    ./ripgrep.nix
    ./unp.nix
    ./vulkan.nix
    ./wl-clipboard.nix
  ];

  utils.ffmpeg.enable = lib.mkDefault false;
  utils.file.enable = lib.mkDefault false;
  utils.fzf.enable = lib.mkDefault false;
  utils.glxinfo.enable = lib.mkDefault false;
  utils.image-magick.enable = lib.mkDefault false;
  utils.jq.enable = lib.mkDefault false;
  utils.ripgrep.enable = lib.mkDefault false;
  utils.parted.enable = lib.mkDefault false;
  utils.unp.enable = lib.mkDefault false;
  utils.vulkan.enable = lib.mkDefault false;
  utils.wl-clipboard.enable = lib.mkDefault false;
}

