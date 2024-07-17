{ config, lib, pkgs, ... }: {
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux module";
  };

  config = lib.mkIf config.tmux.enable {
    home.packages = with pkgs; [
      tmux
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];

    home.file = {
      ".config/tmux/tmux.conf".source = dotfiles/tmux.conf;
    };
  };
}
