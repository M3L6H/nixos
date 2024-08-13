{ config, lib, ... }: {
  options = {
    neovim.plugins.harpoon.enable = lib.mkEnableOption "enables harpoon module";
  };

  config = lib.mkIf config.neovim.plugins.harpoon.enable {
    home.file.".config/nvim/lua/plugins/harpoon.lua".source = ./harpoon.lua;
  };
}

