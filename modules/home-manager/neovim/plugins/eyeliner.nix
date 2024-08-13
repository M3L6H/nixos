{ config, lib, ... }: {
  options = {
    neovim.plugins.eyeliner.enable = lib.mkEnableOption "enables eyeliner module";
  };

  config = lib.mkIf config.neovim.plugins.eyeliner.enable {
    home.file.".config/nvim/lua/plugins/eyeliner.lua".source = ./eyeliner.lua;
  };
}

