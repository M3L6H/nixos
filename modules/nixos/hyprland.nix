{ config, lib, pkgs, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.sessionVariables = {
      # In case the cursor becomes invisible
      # WLR_NO_HARDWARE_CURSORS = "1";

      # Hint electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };

    hardware = {
      graphics.enable = true;

      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
    };

    environment.systemPackages = with pkgs; [
      eww

      # Notifications
      mako
      libnotify

      # Wallpaper engine
      swww

      # App launcher
      rofi-wayland
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    # Enable sound with pipewire
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };
}

