{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    terminal.enable = lib.mkEnableOption "enables terminal module";
  };

  config = lib.mkIf config.terminal.enable {
    programs.kitty = {
      enable = true;

      font = {
        package = pkgs.nerd-fonts.victor-mono;
        name = "VictorMono Nerd Font";
        size = 10;
      };

      settings = {
        # We use tmux for scrollback
        scrollback_lines = 0;

        # Copy to clipboard rather than private buffer
        copy_on_select = "clipboard";

        enable_audio_bell = false;
        confirm_os_window_close = 0;
        tab_bar_edge = "top";

        # Color scheme
        background_opacity = "0.85";
        background_tint = "0.98";

        # Kanagawa colors
        transparent_background_colors = "#12120f #16161D #181820 #1a1a22 #1F1F28 #2A2A37 #363646";

        # Required for dynamically changing the terminal background in kitty
        allow_remote_control = "${if config.scripts.wallpaper-haven.enable then "socket-only" else "no"}";
        listen_on = "${if config.scripts.wallpaper-haven.enable then "unix:/tmp/kitty" else "none"}";
      };

      themeFile = "kanagawa_dragon";
    };

    # Required for dynamically changing the terminal background in kitty
    home.sessionVariables.KITTY_LISTEN_ON = "${
      if config.scripts.wallpaper-haven.enable then "unix:/tmp/kitty" else "none"
    }";
  };
}
