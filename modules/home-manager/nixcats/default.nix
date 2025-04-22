{ config, lib, inputs, username, ... }: let
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

      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }: {
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
            cyberdream-nvim
            lazy-nvim
            mini-icons
            nvim-treesitter.withAllGrammars
            oil-nvim
            which-key-nvim
          ];
        };

        # Empty b/c we are using Lazy.nvim for lazy loading
        optionalPlugins = {};
      });

      packageDefinitions.replace = {
        neovim = {pkgs, name, ... }: {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            aliases = [ "v" "vi" "vim" "nvim" ];
            hosts.python3.enable = true;
            hosts.node.enable = true;
            unwrappedCfgPath = builtins.toString ./.;
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
        ".vim/undodir"
      ];
    };
  };
}
