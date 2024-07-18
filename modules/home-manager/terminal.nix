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
      };
      theme = "Tokyo Night";
    };
  };
}
