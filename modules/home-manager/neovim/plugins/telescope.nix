{ config, lib, ... }: {
  options = {
    neovim.plugins.telescope.enable = lib.mkEnableOption "enables telescope module";
  };

  config = lib.mkIf config.neovim.plugins.telescope.enable {
    home.file.".config/nvim/lua/plugins/telescope.lua".source = ./telescope.lua;

    # We require the c/c++ toolchain for fzf in telescope
    toolchains.c-cpp.enable = true;

    # Ripgrep is required for grep search in telescope
    utils.ripgrep.enable = true;
  };
}

