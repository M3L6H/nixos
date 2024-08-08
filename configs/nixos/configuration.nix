{ config, device, pkgs, user, ... }: {
  imports = [
    ./hardware-configuration.nix
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
	  description = "Nuke root volume";
	  wantedBy = [ "initrd.target" ];
	  after = [ "systemd-cryptsetup@root.service" ];
	  before = [ "sysroot.mount" ];
	  unitConfig.DefaultDependencies = "no";
	  serviceConfig.Type = "oneshot";
	  script = ''
	    mkdir /btrfs_tmp &&
	    echo 'Successfully made /btrfs_tmp' ||
	    echo 'Failed to make /btrfs_tmp'

	    mount -o subvol=/ /dev/mapper/root /btrfs_tmp &&
	    echo 'Successfully mounted /dev/mapper/root' ||
	    echo 'Failed to mount /dev/mapper/root'

	    if [[ -e /btrfs_tmp/@ ]]; then
	      mkdir -p /btrfs_tmp/old_roots
	      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
	      mv /btrfs_tmp/@ "/btrfs_tmp/old_roots/$timestamp"

	      # btrfs subvolume list -o /btfs_tmp/@ |
	      # cut -f 9- -d ' ' |
	      # while read subvolume; do
	      #   btrfs subvolume delete "/btrfs_tmp/$subvolume" &&
	      #   echo "Successfully deleted subvolume $subvolume" ||
	      #   echo "Failed to delete subvolume $subvolume"
	      # done

	      # btrfs subvolume snapshot -r /btfs_tmp/@ /btrfs_tmp/@-"$(date +%FT%TZ)" &&
	      # echo 'Successfully snapshotted root volume' ||
	      # echo 'Failed to snapshot root volume'

	      # btrfs subvolume delete /btrfs_tmp/@ &&
	      # echo 'Successfully deleted root volume' ||
	      # echo 'Failed to delete root volume'
	    fi

	    delete_subvolume_recursively() {
	      IFS=$'\n'
	      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
	        delete_subvolume_recursively "/btrfs_tmp/$i"
	      done
	      btrfs subvolume delete "$1"
	    }

	    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
	      delete_subvolume_recursively "$i"
	    done

	    # btrfs subvolume snapshot /btrfs_tmp/@-blank /btrfs_tmp/@ &&
	    # echo 'Successfully restored root volume to blank state' ||
	    # echo 'Failed to restore root volume to blank state'

	    # sync

	    btrfs subvolume create /btrfs_tmp/root

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

  users.users."${user}" = {
    isNormalUser = true;
    initialPassword = "1";
    extraGroups = [
      "wheel" # Enable sudo for the user
    ];
  };

  # Required for boot
  fileSystems."/persist".neededForBoot = true;

  environment = {
    persistence."/persist" = {
      hideMounts = true;

      directories = [
        {
	  # System config
	  directory = "/etc/nixos";
	  inherit user;
	  group = "users";
	  mode = "0755";
	}
	"/var/lib/nixos" # NixOS state
      ];

      files = [
        "/etc/machine-id" # Machine ID for journalctl
      ];
    };
  };

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

  programs.firefox.enable = true;
}

