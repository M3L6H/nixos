{ config, lib, pkgs, ... }: {
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux module";
  };

  config = let
    tokyo-night-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
      pluginName = "tokyo-night-tmux";
      rtpFilePath = "tokyo-night.tmux";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "janoamaral";
        repo = "tokyo-night-tmux";
        rev = "b45b742eb3fdc01983c21b1763594b549124d065";
        sha256 = "sha256-k4CbfWdyk7m/T97ytxLOEMUKrkU5iJSIu3lvyT1B1jU=";
      };
    };
  in
  lib.mkIf config.tmux.enable {
    utils.wl-clipboard.enable = true; # Used by yank plugin

    programs.tmux = {
      enable = true;
      baseIndex = 1;

      extraConfig = ''
        set-option -sa terminal-overrides ",xterm*:Tc"

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
        sensible
        tokyo-night-tmux
        vim-tmux-navigator
        yank
      ];

      prefix = "M-Space"; # Set prefix to be Alt-Space
      shell = lib.mkIf config.zsh.enable "${pkgs.zsh}/bin/zsh";
      terminal = "xterm-kitty";
    };
  };
}

