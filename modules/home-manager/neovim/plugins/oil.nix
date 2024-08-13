{ config, lib, ... }: {
  options = {
    neovim.plugins.oil.enable = lib.mkEnableOption "enables oil module";
  };

  config = lib.mkIf config.neovim.plugins.oil.enable {
    home.file.".config/nvim/lua/plugins/oil.lua".source = ./oil.lua;
  };
}

