{ config, lib, pkgs, username, ... }: {
  config = lib.mkIf config.hyprland.enable {
    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".cache/swww"
    ];

    systemd.user.services.swww-init-wallpaper = {
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

          ${pkgs.swww}/bin/swww img -t fade -o DP-1 /home/${username}/files/images/unsorted/piano-2/20_piano2_4k.jpg
          sleep 1
          ${pkgs.swww}/bin/swww img -t fade -o HDMI-A-1 /home/${username}/files/images/unsorted/piano-3/21_Piano3_4k.jpg
          ${pkgs.swww}/bin/swww img -t fade -o DP-2 /home/${username}/files/images/unsorted/piano-1/19_piano1_4k.jpg
          sleep 1
          ${pkgs.swww}/bin/swww img -t fade -o DP-2 /home/${username}/files/images/unsorted/piano-1/19_piano1_4k.jpg
        ''}";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}

