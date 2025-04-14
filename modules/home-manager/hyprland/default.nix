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
    ./workspaces.nix
  ];

  config = lib.mkIf config.hyprland.enable {
    home.file.".config/electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';

    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        # Taken from https://wiki.hyprland.org/Nvidia/#environment-variables
        env = [
          "LIBVA_DRIVER_NAME,nvidia"

          # Commenting these out as recommended by:
          # https://github.com/ValveSoftware/steam-for-linux/issues/9588#issuecomment-1648269150
          # "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          # "GBM_BACKEND,nvidia-drm" # Remove this if firefox crashes
          "GDK_BACKEND,wayland,x11,*"
          "QT_QPQ_PLATFORM,wayland;xcb"

          "ELECTRON_OZONE_PLATFORM_HINT,wayland"

          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
        ];

        cursor = {
          no_hardware_cursors = "true";
        };

        misc = {
          focus_on_activate = "true";
        };
      };

      systemd.enable = false;
    };
  };
}

