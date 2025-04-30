{ config, lib, pkgs, username, ... }: let
  dir = "/home/${username}/files/images/wallpaper";
  image1 = "${dir}/wallpaper1.jpg";
  image2 = "${dir}/wallpaper2.jpg";
  image3 = "${dir}/wallpaper3.jpg";
  video =  "${dir}/wallpaper.mp4";
in {
  options = {
    wallpaper.mpvpaper.enable = lib.mkEnableOption "enables mpvpaper wallpaper";
    wallpaper.swww.enable = lib.mkEnableOption "enables swww wallpaper";
  };

  config = {
    # Used to terminate mpvpaper
    utils.killall.enable = true;

    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".cache/swww"
    ];

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

          ${pkgs.swww}/bin/swww img -t fade -o DP-1 ${image1}
          sleep 1
          ${pkgs.swww}/bin/swww img -t fade -o HDMI-A-1 ${image2}
          ${pkgs.swww}/bin/swww img -t fade -o DP-2 ${image3}
          sleep 1
          ${pkgs.swww}/bin/swww img -t fade -o DP-2 ${image3}
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

        MPV_ARGS='no-audio --loop-file=inf input-ipc-server=/tmp/mpv-socket'
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

