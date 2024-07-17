{ config, lib, pkgs, ... }: {
  options = {
    users.enable = lib.mkEnableOption "enables users module";
    users.zsh.enable = lib.mkEnableOption "enables zsh as default shell";
  };

  config = lib.mkIf config.users.enable {
    users.zsh.enable = lib.mkDefault true;

    environment.systemPackages = with pkgs; [
      home-manager
    ];

    programs.zsh.enable = config.users.zsh.enable;

    # Completion for system packages (e.g. systemd)
    environment.pathsToLink = lib.mkIf config.users.zsh.enable [ "/share/zsh" ];

    users.users.m3l6h = {
      isNormalUser = true;
      description = "Michael Hollingworth";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
      shell = lib.mkIf config.users.zsh.enable pkgs.zsh;
    };
  };
}
