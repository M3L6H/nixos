{ config, lib, pkgs, ... }: {
  options = {
    zsh.vi-mode.enable = lib.mkEnableOption "enables zsh vi mode plugin";
  };

  config = lib.mkIf config.zsh.vi-mode.enable {
    home.packages = [ pkgs.zsh-vi-mode ];
    utils.wl-clipboard.enable = true; # Used to yank to clipboard

    home.file.".zsh-custom/plugins/zsh-vi-mode" = {
      recursive = true;
      source = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
    };

    programs.zsh.oh-my-zsh.plugins = [ "zsh-vi-mode" ];

    home.file.".zsh-custom/my-custom/zsh-vi-mode.sh".source = ./zsh-vi-mode.sh;
  };
}

