{ config, lib, ... }: {
  imports = [
    ./colorscheme.nix
    ./eyeliner.nix
    ./harpoon.nix
    ./lspconfig.nix
    ./mason-lspconfig.nix
    ./mason.nix
    ./nvim-cmp.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
    ./undotree.nix
    ./vim-tmux-navigator.nix
    ./zen-mode.nix
  ];

  config = lib.mkIf config.neovim.enable {
    neovim.plugins.colorscheme.enable = lib.mkDefault true;
    neovim.plugins.eyeliner.enable = lib.mkDefault true;
    neovim.plugins.harpoon.enable = lib.mkDefault true;
    neovim.plugins.lspconfig.enable = lib.mkDefault true;
    neovim.plugins.mason.enable = lib.mkDefault false;
    neovim.plugins.nvim-cmp.enable = lib.mkDefault true;
    neovim.plugins.oil.enable = lib.mkDefault true;
    neovim.plugins.telescope.enable = lib.mkDefault true;
    neovim.plugins.treesitter.enable = lib.mkDefault true;
    neovim.plugins.undotree.enable = lib.mkDefault true;
    neovim.plugins.vim-tmux-navigator.enable = lib.mkDefault true;
    neovim.plugins.zen-mode.enable = lib.mkDefault false;
  };
}

