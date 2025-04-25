{ config, lib, pkgs, username, ... }: {
  options = {
    utils.nvr.enable = lib.mkEnableOption "enables neovim-remote module";
  };

  config = lib.mkIf config.utils.nvr.enable {
    home.packages = with pkgs; [
      neovim-remote
    ];

    home.file.".local/bin/nvr-wrapper.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        nvr -s --remote "$@" \
        && tmux select-window -t 1
      '';
    };

    home.shellAliases.v   = "/home/${username}/.local/bin/nvr-wrapper.sh";
    home.shellAliases.vi  = "/home/${username}/.local/bin/nvr-wrapper.sh";
    home.shellAliases.vim = "/home/${username}/.local/bin/nvr-wrapper.sh";
  };
}

