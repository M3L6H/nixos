{ config, lib, ... }: {
  options = {
    neovim.plugins.zen-mode.enable = lib.mkEnableOption "enables zen-mode module";
  };

  config = lib.mkIf config.neovim.plugins.zen-mode.enable {
    home.file.".config/nvim/lua/plugins/zen-mode.lua".source = ./zen-mode.lua;
  };
}

