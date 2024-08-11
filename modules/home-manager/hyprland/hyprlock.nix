{ config, lib, ... }: {
  config = lib.mkIf config.hyprland.enable {
    home.file.".config/hypr/hyprlock.conf" = {
      text = ''
        # Inspired by https://github.com/justinmdickey/publicdots/blob/main/.config/hypr/hyprlock.conf

        general {
          disable_loading_bar = true
          grace = 30
        }

        background {
          monitor = DP-1
          path = /home/m3l6h/files/images/sfw/wlop/sky-1/20_sky1_8k.jpg
          blur_passes = 2
          contrast = 1
          brightness = 0.75
          vibrancy = 0.2
          vibrancy_darkness = 0.2
        }

        background {
          monitor = DP-2
          path = /home/m3l6h/files/images/sfw/wlop/sky-2/21_sky2_8k.jpg
          blur_passes = 2
          contrast = 1
          brightness = 0.75
          vibrancy = 0.2
          vibrancy_darkness = 0.2
        }

        background {
          monitor = HDMI-A-1
          path = /home/m3l6h/files/images/sfw/wlop/sky-3/22_sky3_8k.jpg
          blur_passes = 2
          contrast = 1
          brightness = 0.75
          vibrancy = 0.2
          vibrancy_darkness = 0.2
        }

        input-field {
          monitor = DP-2
          size = 250, 60
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.35 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(0, 0, 0, 0)
          inner_color = rgba(0, 0, 0, 0.2)
          font_color = rgb(255, 255, 255)
          fade_on_empty = false
          rounding = -1
          check_color = rgb(204, 136, 34)
          placeholder_text = <i><span foreground="##cdd6f4">Input Password...</span></i>
          hide_input = false
          position = 0, -200
          halign = center
          valign = center
        }
      '';
    };
  };
}

