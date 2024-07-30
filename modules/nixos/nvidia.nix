{ config, inputs, lib, pkgs, ... }: {
  options = {
    nvidia.enable = lib.mkEnableOption "enables nvidia module";
  };

  config = lib.mkIf config.nvidia.enable {
    nixpkgs.config.allowUnfree = true;

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
      };
    };
  };
}

