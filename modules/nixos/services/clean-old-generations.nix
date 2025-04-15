{ config, lib, pkgs, ... }: {
  options = {
    services.clean-old-generations.enable = lib.mkEnableOption "enables clean old generations module";
  };

  config = lib.mkIf config.services.clean-old-generations.enable {
    systemd.timers.clean-old-generations = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "weekly";
        Persistent = "true";
        Unit = "clean-old-generations.service";
      };
    };

    systemd.services.clean-old-generations = {
      description = "Clean old NixOS generations";
      serviceConfig = {
        Type = "oneshot";
        User = "root";
      };
      script = ''
        echo 'BEGIN clean-old-generations'
        seven_days_ago="$(date +%s -d '7 days ago')"
        gen_date="$(${pkgs.nixos-rebuild}/bin/nixos-rebuild list-generations |
          tail -n +7 |
          head -1 |
          ${pkgs.gawk}/bin/awk '{ print $2; }'
        )"

        if [ -n "$gen_date" ]; then
          gen_date="$(date +%s -d "$gen_date")"

          if [ "$gen_date" -lt "$seven_days_ago" ]; then
            older_than="$(( ((seven_days_ago - gen_date) / 86400) + 7))d"
          else
            older_than="7d"
          fi

          echo "Deleting older than $older_than"
          ${pkgs.nix}/bin/nix-collect-garbage --delete-older-than "$older_than"
        else
          echo "Nothing to delete"
        fi

        echo 'END clean-old-generations'
      '';
    };
  };
}

