{ config, lib, username, ... }: {
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim module";
  };

  imports = [ ./plugins ];

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = ''
      vim.g.lsps = {
        ${if config.toolchains.markdown.enable then "'marksman'," else ""}
        ${if config.toolchains.nix.enable then "'nil_ls'," else ""}
      }
      ${builtins.readFile ./lazy-bootstrap.lua}
      ${builtins.readFile ./opts.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./lazy-setup.lua}
      ${builtins.readFile ./autocmds.lua}
      '';
    };

    home.shellAliases.v = "nvim";

    home.persistence."/persist/home/${username}" = {
      directories = lib.mkIf config.impermanence.enable [
        ".local/share/nvim/lazy"
        ".local/state/nvim/lazy"
      ];

      files = lib.mkIf config.impermanence.enable [
        ".config/nvim/lazy-lock.json"
      ];
    };
  };
}

