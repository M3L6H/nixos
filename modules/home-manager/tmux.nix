{ config, lib, pkgs, ... }: {
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux module";
  };

  config = lib.mkIf config.tmux.enable {
    utils.wl-clipboard.enable = true; # Used by yank plugin

    programs.tmux = {
      enable = true;
      baseIndex = 1;

      extraConfig = ''
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",xterm-256color:Tc"

        # Shift-Alt- vim keys to switch windows
        bind -n M-H previous-window
        bind -n M-L next-window

        # Enter copy mode with Alt-v
        bind-key -n 'M-v' copy-mode

        # Proper vim select
        bind-key -T copy-mode-vi 'v' send -X begin-selection
        bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle

        # Open panes in current directory
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
      '';

      keyMode = "vi";
      mouse = true;

      plugins = with pkgs.tmuxPlugins; [
        kanagawa
        sensible
        vim-tmux-navigator
        yank
      ];

      prefix = "M-Space"; # Set prefix to be Alt-Space
      shell = lib.mkIf config.zsh.enable "${pkgs.zsh}/bin/zsh";
      terminal = "xterm-kitty";
    };
  };
}

