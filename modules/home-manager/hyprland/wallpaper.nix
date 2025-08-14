{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  dir = "/home/${username}/files/images/wallpaper";
  image = "${dir}/wallpaper.jpg";
  video = "${dir}/wallpaper.mp4";
in
{
  options = {
    wallpaper.mpvpaper.enable = lib.mkEnableOption "enables mpvpaper wallpaper";
    wallpaper.swww.enable = lib.mkEnableOption "enables swww wallpaper";
  };

  config = {
    # Used to terminate mpvpaper
    utils.killall.enable = true;

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".cache/swww"
      ];

      allowOther = false;
    };

    systemd.user.services.swww-init-wallpaper = lib.mkIf config.wallpaper.swww.enable {
      Unit = {
        Description = "swww-init-wallpaper";
        Wants = [ "swww-daemon.service" ];
        After = [ "swww-daemon.service" ];
      };
      Install = {
        WantedBy = [ "swww-daemon.service" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.writeShellScript "swww-init-wallpaper" ''
          #!/run/current-system/sw/bin/bash

          ${pkgs.swww}/bin/swww img -t fade -o DP-1 ${image}
          sleep 1
          ${pkgs.swww}/bin/swww img -t fade -o HDMI-A-1 ${image}
          ${pkgs.swww}/bin/swww img -t fade -o DP-2 ${image}
          sleep 1
          ${pkgs.swww}/bin/swww img -t fade -o DP-2 ${image}
        ''}";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    wayland.windowManager.hyprland.settings = lib.mkIf config.wallpaper.mpvpaper.enable {
      exec-once = [
        "mpvpaper -p -o 'no-audio --loop-file=inf input-ipc-server=/tmp/mpv-socket' '*' ${video}"
      ];
    };

    home.file.".local/bin/choose-wallpaper.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        # Use gpu-api vulkan due to:
        # https://github.com/mpv-player/mpv/issues/15099#issuecomment-2413464065
        MPV_ARGS='--gpu-api=vulkan no-audio --loop-file=inf input-ipc-server=/tmp/mpv-socket'
        selection="$(ls ${dir} | rofi -dmenu)"

        # If we selected a specific wallpaper, then display it
        if [ -n "$selection" ]; then
          killall .mpvpaper-wrapp

          # If we selected a video wallpaper, use mpvpaper
          if [ "''${selection#*.}" = 'mp4' ]; then
            mpvpaper -p -f -o "$MPV_ARGS" '*' ${video}
          # Otherwise use swww
          else
            swww img -o DP-1 "${dir}/$selection"
            sleep 1
            swww img -o HDMI-A-1 "${dir}/$selection"
            sleep 1
            swww img -o DP-2 "${dir}/$selection"
          fi
        # Otherwise toggle between video and image wallpaper
        elif ! killall .mpvpaper-wrapp; then
          mpvpaper -p -f -o "$MPV_ARGS" '*' ${video}
        fi
      '';
    };
  };
}
