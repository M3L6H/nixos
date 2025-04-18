{ config, lib, pkgs, ... }: {
  options = {
    terminal.enable = lib.mkEnableOption "enables terminal module";
  };

  config = lib.mkIf config.terminal.enable {
    programs.kitty = {
      enable = true;

      font = {
        package = pkgs.nerd-fonts.victor-mono;
        name = "VictorMono Nerd Font";
      };

      settings = {
        # Copy to clipboard rather than private buffer
        copy_on_select = "clipboard";

        enable_audio_bell = false;
        confirm_os_window_close = 0;
        tab_bar_edge = "top";

        # Color scheme
        background_opacity = "0.85";
        background_tint = "0.98";

        # Required for dynamically changing the terminal background in kitty
        allow_remote_control = "${if config.scripts.wallpaper-haven.enable then "socket-only" else "no"}";
        listen_on = "${if config.scripts.wallpaper-haven.enable then "unix:/tmp/kitty" else "none"}";
      };

      themeFile = "tokyo_night_night";
    };

    # Required for dynamically changing the terminal background in kitty
    home.sessionVariables.KITTY_LISTEN_ON = "${if config.scripts.wallpaper-haven.enable then "unix:/tmp/kitty" else "none"}";
  };
}

