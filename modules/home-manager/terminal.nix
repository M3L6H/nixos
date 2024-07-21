{ config, lib, pkgs, ... }: {
  options = {
    terminal.enable = lib.mkEnableOption "enables terminal module";
  };

  config = lib.mkIf config.terminal.enable {
    programs.kitty = {
      enable = true;
      font = {
        package = (pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; });
        name = "VictorMono Nerd Font";
      };
      settings = {
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        tab_bar_edge = "top";

        # Color scheme
        background_tint = "0.98";

        # Required for dynamically changing the terminal background in kitty
        allow_remote_control = "${if config.scripts.wallpaper-haven.enable then "socket-only" else "no"}";
        listen_on = "${if config.scripts.wallpaper-haven.enable then "unix:/tmp/kitty" else "none"}";
      };
      theme = "Tokyo Night";
    };

    # Required for dynamically changing the terminal background in kitty
    home.sessionVariables.KITTY_LISTEN_ON = "${if config.scripts.wallpaper-haven.enable then "unix:/tmp/kitty" else "none"}";
  };
}

