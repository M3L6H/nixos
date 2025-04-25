{ config, lib, inputs, username, ... }: let
  colorscheme = "kanagawa";
  utils = inputs.nixCats.utils;
in {
  options = {
    nixcats.enable = lib.mkEnableOption "enables nixcats-nvim";
  };

  imports = [
    inputs.nixCats.homeModule
  ];

  config = lib.mkIf config.nixcats.enable {
    nixCats = {
      enable = true;

      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];

      packageNames = [ "neovim" ];

      luaPath = ./.;

      categoryDefinitions.replace = ({ pkgs, ... }: {
        lspsAndRuntimeDeps = {
          lua = with pkgs; [
            fzf
            lua-language-server
            nixd
            ripgrep
            stylua
          ];
        };

        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lazy-nvim
            mini-diff
            mini-icons
            mini-statusline
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            oil-nvim
            smartcolumn-nvim
            vim-tmux-navigator
            which-key-nvim
          ] ++ [
            pkgs.vimPlugins."${colorscheme}-nvim"
          ];
        };

        # Empty b/c we are using Lazy.nvim for lazy loading
        optionalPlugins = {};
      });

      packageDefinitions.replace = {
        neovim = {pkgs, ... }: {
          settings = {
            colorscheme = colorscheme;
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            aliases = [
              "nvim"
            ] ++ lib.optionals (!config.utils.nvr.enable) [ # nvr module defines these aliases
              "v"
              "vi"
              "vim"
            ];
            hosts.python3.enable = true;
            hosts.node.enable = true;
            unwrappedCfgPath = "${config.home.homeDirectory}/.local/state/nvim/lazy";
          };
          categories = {
            general = true;
            lua = true;
            nix = true;
          };
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };

    home.persistence."/persist/home/${username}" = {
      directories = lib.mkIf config.impermanence.enable [
        ".local/share/nvim"
        ".local/state/nvim"
        ".vim/undodir"
      ];
    };
  };
}
