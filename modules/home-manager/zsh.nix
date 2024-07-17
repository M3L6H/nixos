{ config, lib, pkgs, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh module";
    zsh.zoxide.enable = lib.mkEnableOption "enables zoxide";
  };

  config = lib.mkIf config.zsh.enable {
    zsh.zoxide.enable = lib.mkDefault true;

    programs.zoxide.enable = config.zsh.zoxide.enable;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;

      envExtra = ''
      ${if config.tmux.enable then "export ZSH_TMUX_AUTOSTART=true" else ""}
      ${if config.zsh.zoxide.enable then "export ZOXIDE_CMD_OVERRIDE='cd'" else ""}
      '';

      history = {
        expireDuplicatesFirst = true;
      };

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
