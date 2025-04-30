{ config, lib, pkgs, username, ... }: let
  image1 = "/home/${username}/files/images/wallpaper/wallpaper1.jpg";
  image2 = "/home/${username}/files/images/wallpaper/wallpaper2.jpg";
  image3 = "/home/${username}/files/images/wallpaper/wallpaper3.jpg";
  video =  "/home/${username}/files/images/wallpaper/wallpaper.mp4";
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
      exec = [
        "mpvpaper -p -o 'no-audio --loop-file=inf input-ipc-server=/tmp/mpv-socket' '*' ${video}"
      ];
    };

    home.file.".local/bin/toggle-wallpaper.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        if killall .mpvpaper-wrapp; then
          ${pkgs.swww}/bin/swww img -o DP-1 ${image1}
          sleep 1
          ${pkgs.swww}/bin/swww img -o HDMI-A-1 ${image2}
          sleep 1
          ${pkgs.swww}/bin/swww img -o DP-2 ${image3}
        else
          mpvpaper -p -o 'no-audio --loop-file=inf input-ipc-server=/tmp/mpv-socket' '*' ${video}
        fi
      '';
    };
  };
}

