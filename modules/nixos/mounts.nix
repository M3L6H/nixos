{ config, lib, pkgs, ... }: {
  options = {
    mounts.enable = lib.mkEnableOption "enables mounts module";
  };

  config = lib.mkIf config.mounts.enable {
    fileSystems."/mnt/files" = {
      device = "/dev/disk/by-uuid/13fc2c6d-1aa9-48c6-980c-8717bf3871ed";
      fsType = "ext4";
      options = [
        "rw"
        "users" # Allow any user to mount and unmount
        "nofail" # Prevent the system from failing if the drive does not exist
        "umask=0000" # Allow access for everybody
      ];
    };
  };
}

