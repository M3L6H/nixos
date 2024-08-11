{ config, lib, ... }: {
  config = lib.mkIf config.hyprland.enable {
    home.file.".config/hypr/hypridle.conf" = {
      text = ''
        general {
          lock_cmd = pidof hyprlock || hyprlock # avoid starting multiple hyprlock instances
          before_sleep_cmd = loginctl lock-session
          after_sleep_cmd = hyprctl dispatch dpms on # to avoid having to press a key twice to turn on the display
        }

        listener {
          timeout = 150
          on-timeout = brightnessctl -s set 10 # set monitor backlight to minimum, avoid 0 on OLED monitor
          on-resume = brightnessctl -r # monitor backlight restore
        }

        listener {
          timeout = 300
          on-timeout = loginctl lock-session
        }

        listener {
          timeout = 360
          on-timeout = hyprctl dispatch dpms off # screen off when timeout has passed
          on-resume = hyprctl dispatch dpms on # screen on when activity is detected after timeout has fired
        }

        listener {
          timeout = 600
          on-timeout = systemctl suspend # suspend pc
        }
      '';
    };
  };
}

