{ config, lib, ... }: {
  options = {
    neovim.plugins.undotree.enable = lib.mkEnableOption "enables undotree module";
  };

  config = lib.mkIf config.neovim.plugins.undotree.enable {
    home.file.".config/nvim/lua/plugins/undotree.lua".source = ./undotree.lua;
  };
}

