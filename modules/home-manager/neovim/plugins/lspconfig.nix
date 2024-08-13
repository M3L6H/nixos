{ config, lib, ... }: {
  options = {
    neovim.plugins.lspconfig.enable = lib.mkEnableOption "enables lspconfig module";
  };

  config = lib.mkIf config.neovim.plugins.lspconfig.enable {
    home.file.".config/nvim/lua/plugins/lspconfig.lua".source = ./lspconfig.lua;
  };
}

