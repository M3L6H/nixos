{ config, lib, ... }: {
  options = {
    neovim.plugins.treesitter.enable = lib.mkEnableOption "enables treesitter module";
  };

  config = lib.mkIf config.neovim.plugins.treesitter.enable {
    home.file.".config/nvim/lua/plugins/treesitter.lua".source = ./treesitter.lua;
  };
}

