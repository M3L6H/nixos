{ config, device, inputs, pkgs, username, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  system.stateVersion = "24.05";

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiInstallAsRemovable = true;
        efiSupport = true;
        useOSProber = true;
      };
    };

    kernelParams = [
      "resume_offset=533760" # Retrieved by running `btrfs inspect-internal map-swapfile -r /mnt/swap/swapfile`
    ];

    resumeDevice = device;

    initrd = {
      systemd = {
        enable = true;

        services.rollback = {
          description = "Nuke root & home subvolumes";
          wantedBy = [ "initrd.target" ];
          after = [ "systemd-cryptsetup@root.service" ];
          before = [ "sysroot.mount" ];
          unitConfig.DefaultDependencies = "no";
          serviceConfig.Type = "oneshot";
          script = ''
            mkdir /btrfs_tmp

            mount -o subvol=/ /dev/mapper/root /btrfs_tmp

            nuke_subvolume() {
              if [[ -e "/btrfs_tmp/$1" ]]; then
                btrfs subvolume list -o "/btrfs_tmp/$1" |
                cut -f 9- -d ' ' |
                while read subvolume; do
                  btrfs subvolume delete "/btrfs_tmp/$subvolume"
                done

                btrfs subvolume snapshot -r "/btrfs_tmp/$1" "/btrfs_tmp/$1-$(date +%FT%TZ)"

                btrfs subvolume delete "/btrfs_tmp/$1"
              fi

              btrfs subvolume snapshot "/btrfs_tmp/$1-blank" "/btrfs_tmp/$1"
            }

            nuke_subvolume '@'

            sync

            umount /btrfs_tmp
          '';
        };
      };
    };
  };

  console = {
    earlySetup = true;
    keyMap = "us";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  programs.fuse.userAllowOther = true;

  # Hide sudo lectures
  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  # Enable disk mounts
  mounts.enable = true;

  # Enable nvidia module
  nvidia.enable = true;

  # Enable steam module
  steam.enable = true;

  # Home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs username; };
    users = {
      "${username}" = import ../../homes/${username}/home.nix;
    };
  };
}

