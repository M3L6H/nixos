{ config, lib, username, ... }: {
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim module";
  };

  imports = [
    ./plugins/colorscheme.nix
    ./plugins/eyeliner.nix
    ./plugins/harpoon.nix
    ./plugins/lspconfig.nix
    ./plugins/mason-lspconfig.nix
    ./plugins/mason.nix
    ./plugins/nvim-cmp.nix
    ./plugins/oil.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/undotree.nix
    ./plugins/zen-mode.nix
  ];

  config = lib.mkIf config.neovim.enable {
    neovim.plugins.colorscheme.enable = lib.mkDefault true;
    neovim.plugins.eyeliner.enable = lib.mkDefault true;
    neovim.plugins.harpoon.enable = lib.mkDefault true;
    neovim.plugins.lspconfig.enable = lib.mkDefault true;
    neovim.plugins.mason.enable = lib.mkDefault false;
    neovim.plugins.nvim-cmp.enable = lib.mkDefault true;
    neovim.plugins.oil.enable = lib.mkDefault true;
    neovim.plugins.telescope.enable = lib.mkDefault true;
    neovim.plugins.treesitter.enable = lib.mkDefault true;
    neovim.plugins.undotree.enable = lib.mkDefault true;
    neovim.plugins.zen-mode.enable = lib.mkDefault false;

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

