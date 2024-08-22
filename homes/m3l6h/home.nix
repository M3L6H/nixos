{ ... }: {
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home.stateVersion = "24.05";

  home.username = "m3l6h";
  home.homeDirectory = "/home/m3l6h";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable GPG keys
  gpg.enable = true;

  # Enable management of hyprland through home-manager
  hyprland.enable = true;

  # Enable neovim
  neovim.enable = true;

  # Enable kitty
  terminal.enable = true;

  # Enable tmux
  tmux.enable = true;

  # Enable managed user dirs
  user-dirs.enable = true;

  # Enable zsh
  zsh.enable = true;

  # Enable minecraft
  games.minecraft.enable = true;

  # Enable steam
  games.steam.enable = true;

  # Enable factorio
  games.steam.factorio.enable = false;

  # Enable wallpaper haven script
  scripts.wallpaper-haven.enable = false;

  # Enable bazecor
  software.bazecor.enable = true;

  # Enable digikam
  software.digikam.enable = true;

  # Enable firefox
  software.firefox.enable = true;

  # Enable markdown toolchain
  toolchains.markdown.enable = true;

  # Enable ffmpeg util
  utils.ffmpeg.enable = true;

  # Enable file util
  utils.file.enable = true;

  # Enable parted util
  utils.parted.enable = false;

  # Enable unp util
  utils.unp.enable = true;
}

