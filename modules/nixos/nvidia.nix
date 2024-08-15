{ config, lib, ... }: {
  options = {
    nvidia.enable = lib.mkEnableOption "enables nvidia module";
  };

  config = lib.mkIf config.nvidia.enable {
    # Use proprietary drivers
    nixpkgs.config.allowUnfree = true;

    # For suspend/wakeup
    boot.kernelParams = [
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "nvidia.NVreg_TemporaryFilePath=/var/tmp"
    ];

    # Load nvidia driver for xorg and wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
      # Enable OpenGL
      graphics.enable = true;

      nvidia = {
        # Most wayland compositors need this
        modesetting.enable = true;

        # Enable Nvidia settings menu
        nvidiaSettings = true;

        # Nvidia driver
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        # For suspend/wakeup
        powerManagement = {
          enable = true;
        };

        # Disable open-dkms due to this bug: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
        open = false;
      };
    };
  };
}

