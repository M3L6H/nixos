{ config, lib, inputs, ... }: let
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

      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = {
          lua = with pkgs; [
            fzf
            lua-language-server
            nil
            ripgrep
            stylua
          ];
        };

        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lazy-nvim
            nvim-treesitter.withAllGrammars
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
  };
}
