{ config, lib, pkgs, ... }: {
  options = {
    utils.unp.enable = lib.mkEnableOption "enables unp module";
  };

  config = lib.mkIf config.utils.unp.enable {
    home.packages = with pkgs; [
      unrar-free # For unpacking rar archives
      unp # Super unpacker
      unzip # For unpacking zip archives
    ];
  };
}

