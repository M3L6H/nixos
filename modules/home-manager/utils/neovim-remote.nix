{ config, lib, pkgs, ... }: {
  options = {
    utils.nvr.enable = lib.mkEnableOption "enables neovim-remote module";
  };

  config = lib.mkIf config.utils.nvr.enable {
    home.packages = with pkgs; [
      neovim-remote
    ];

    home.shellAliases.v   = "nvr -s --remote";
    home.shellAliases.vi  = "nvr -s --remote";
    home.shellAliases.vim = "nvr -s --remote";
  };
}

