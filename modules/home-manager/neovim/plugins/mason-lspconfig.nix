{ config, lib, ... }: {
  config = lib.mkIf config.neovim.plugins.mason.enable {
    home.file.".config/nvim/lua/plugins/mason-lspconfig.lua".source = ./mason-lspconfig.lua;
  };
}

