{ config, lib, pkgs, ... }: {
  options = {
    utils.vulkan.enable = lib.mkEnableOption "enables vulkan module";
  };

  config = lib.mkIf config.utils.vulkan.enable {
    home.packages = with pkgs; [
      vulkan-tools
    ];
  };
}

