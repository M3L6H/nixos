{ config, lib, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland module";
  };

  imports = [
    ./rofi
    ./binds.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./monitors.nix
    ./wallpaper.nix
  ];

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        # Taken from https://wiki.hyprland.org/Nvidia/#environment-variables
        env = [
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,wayland"
          "GBM_BACKEND,nvidia-drm" # Remove this if firefox crashes
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        ];

        cursor = {
          no_hardware_cursors = "true";
        };

        misc = {
          focus_on_activate = "true";
        };
      };

      systemd.variables = [ "--all" ];
    };
  };
}

