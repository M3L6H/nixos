{ config, lib, pkgs, ... }: {
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux module";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      mouse = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
      ];
      shell = lib.mkIf config.zsh.enable "${pkgs.zsh}/bin/zsh";
      terminal = "xterm-kitty";
    };
  };
}
