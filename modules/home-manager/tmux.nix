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
        # Shift-Alt- vim keys to switch windows
        bind -n M-H previous-window
        bind -n M-L next-window

        # Reload tmux with PREFIX+r
        bind r source-file ~/.config/tmux/tmux.conf

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
        {
          plugin = kanagawa;
          extraConfig = ''
            set -g @kanagawa-theme dragon

            # Transparent background
            set -g @kanagawa-ignore-window-colors true

            # Powerline
            set -g @kanagawa-show-powerline true

            # Widgets
            set -g @kanagawa-military-time true
            set -g @kanagawa-left-icon 󱚝
            set -g @kanagawa-show-battery false
            set -g @kanagawa-show-farenheit true
            set -g @kanagawa-show-location false
            set -g @kanagawa-show-timezone false
            set -g @kanagawa-show-empty-plugins false
            set -g @kanagawa-show-left-sep 
            set -g @kanagawa-show-right-sep 
          '';
        }
        sensible
        vim-tmux-navigator
        yank
      ];

      prefix = "M-Space"; # Set prefix to be Alt-Space
      shell = lib.mkIf config.zsh.enable "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
    };
  };
}

