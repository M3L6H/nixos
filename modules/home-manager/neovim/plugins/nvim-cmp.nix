{ config, lib, ... }: {
  options = {
    neovim.plugins.nvim-cmp.enable = lib.mkEnableOption "enables nvim-cmp module";
  };

  config = lib.mkIf config.neovim.plugins.nvim-cmp.enable {
    home.file.".config/nvim/lua/plugins/nvim-cmp.lua".source = ./nvim-cmp.lua;
  };
}

