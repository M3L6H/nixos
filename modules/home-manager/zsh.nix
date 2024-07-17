{ config, lib, pkgs, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh module";
    zsh.zoxide.enable = lib.mkEnableOption "enables zoxide";
  };

  config = lib.mkIf config.zsh.enable {
    zsh.zoxide.enable = lib.mkDefault true;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;

      envExtra = ''
      ${if config.zsh.zoxide.enable then "export ZOXIDE_CMD_OVERRIDE='cd'" else ""}
      '';

      history = {
        expireDuplicatesFirst = true;
      };

      initExtra = ''
      ${if config.tmux.enable then "tmux source ~/.config/tmux/tmux.conf" else ""}
      '';

      oh-my-zsh = {
        enable = true;
	plugins = [
	  "git"
	] ++ lib.optionals (config.tmux.enable) [
	  "tmux"
	] ++ lib.optionals (config.zsh.zoxide.enable) [
	  "zoxide"
	];
      };
    };
  };
}
