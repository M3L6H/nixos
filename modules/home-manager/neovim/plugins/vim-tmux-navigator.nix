{ config, lib, ... }: {
  options = {
    neovim.plugins.vim-tmux-navigator.enable = lib.mkEnableOption "enables vim-tmux-navigator module";
  };

  config = lib.mkIf config.neovim.plugins.vim-tmux-navigator.enable {
    home.file.".config/nvim/lua/plugins/vim-tmux-navigator.lua".source = ./vim-tmux-navigator.lua;
  };
}

