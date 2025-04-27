{ lib, ... }: {
  imports = [
    ./bat.nix
    ./ffmpeg.nix
    ./file.nix
    ./fzf.nix
    ./glxinfo.nix
    ./image-magick.nix
    ./iw.nix
    ./jq.nix
    ./killall.nix
    ./lsof.nix
    ./neovim-remote.nix
    ./parted.nix
    ./playerctl.nix
    ./ripgrep.nix
    ./unp.nix
    ./vulkan.nix
    ./wget.nix
    ./wl-clipboard.nix
  ];

  utils.bat.enable = lib.mkDefault false;
  utils.ffmpeg.enable = lib.mkDefault false;
  utils.file.enable = lib.mkDefault false;
  utils.fzf.enable = lib.mkDefault false;
  utils.glxinfo.enable = lib.mkDefault false;
  utils.image-magick.enable = lib.mkDefault false;
  utils.iw.enable = lib.mkDefault false;
  utils.jq.enable = lib.mkDefault false;
  utils.killall.enable = lib.mkDefault false;
  utils.lsof.enable = lib.mkDefault false;
  utils.nvr.enable = lib.mkDefault false;
  utils.ripgrep.enable = lib.mkDefault false;
  utils.parted.enable = lib.mkDefault false;
  utils.playerctl.enable = lib.mkDefault false;
  utils.unp.enable = lib.mkDefault false;
  utils.vulkan.enable = lib.mkDefault false;
  utils.wget.enable = lib.mkDefault false;
  utils.wl-clipboard.enable = lib.mkDefault false;
}

