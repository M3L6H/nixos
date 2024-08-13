{ config, lib, ... }: {
  options = {
    neovim.plugins.colorscheme.enable = lib.mkEnableOption "enables colorscheme module";
  };

  config = lib.mkIf config.neovim.plugins.colorscheme.enable {
    home.file.".config/nvim/lua/plugins/colorscheme.lua".source = ./colorscheme.lua;
  };
}

