{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.hyprland.enable {
    # Used to toggle suspend on/off
    scripts.conditional-suspend.enable = true;

    home.packages = with pkgs; [
      brightnessctl
    ];

    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display
        };

        listener = [
          {
            timeout = "90";
            on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor
            on-resume = "brightnessctl -r"; # monitor backlight restore
          }
          {
            timeout = "180";
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = "360";
            on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
            on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired
          }
          {
            timeout = "1800";
            on-timeout = "conditional-suspend"; # suspend pc
          }
        ];
      };
    };
  };
}
