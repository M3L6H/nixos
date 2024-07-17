{ config, lib, pkgs, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh module";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      zsh
    ];

    home.file = {
      ".zshrc".text = ''
      ${if config.tmux.enable then "tmux source ~/.config/tmux/tmux.conf" else ""}
      '';
    };
  };
}
