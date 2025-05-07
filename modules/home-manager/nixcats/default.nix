{
  config,
  lib,
  hostname,
  inputs,
  username,
  ...
}:
let
  colorscheme = "kanagawa";
  utils = inputs.nixCats.utils;
in
{
  options = {
    nixcats.enable = lib.mkEnableOption "enables nixcats-nvim";
  };

  imports = [
    inputs.nixCats.homeModule
  ];

  config = lib.mkIf config.nixcats.enable {
    utils.chafa.enable = true; # Used in neovim dashboard
    utils.fzf.enable = true; # Used in picker
    utils.gh.enable = true; # Used in neovim dashboard
    utils.image-magick.enable = true; # Used in snacks image module
    utils.ripgrep.enable = true; # Used in picker

    # Tone down nixd logs
    home.sessionVariables.NIXD_FLAGS = "-log=error";

    nixCats = {
      enable = true;

      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];

      packageNames = [ "neovim" ];

      luaPath = ./.;

      categoryDefinitions.replace = (
        { pkgs, ... }:
        {
          lspsAndRuntimeDeps = {
            lua = with pkgs; [
              lua-language-server
              nixd
              nixfmt-rfc-style
              stylua
            ];
          };

          startupPlugins = {
            general =
              with pkgs.vimPlugins;
              [
                lazy-nvim
                blink-cmp
                conform-nvim
                flash-nvim
                guess-indent-nvim
                lazydev-nvim
                mini-diff
                mini-icons
                mini-statusline
                nvim-autopairs
                nvim-lspconfig
                nvim-treesitter.withAllGrammars
                oil-nvim
                smartcolumn-nvim
                smear-cursor-nvim
                snacks-nvim
                vim-tmux-navigator
                which-key-nvim
              ]
              ++ [
                pkgs.vimPlugins."${colorscheme}-nvim"
              ];
          };

          # Empty b/c we are using Lazy.nvim for lazy loading
          optionalPlugins = { };
        }
      );

      packageDefinitions.replace = {
        neovim =
          { pkgs, ... }:
          {
            settings = {
              colorscheme = colorscheme;
              suffix-path = true;
              suffix-LD = true;
              wrapRc = true;
              aliases =
                [
                  "nvim"
                ]
                ++ lib.optionals (!config.utils.nvr.enable) [
                  # nvr module defines these aliases
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
              nixdExtras.nixpkgs = ''import (builtins.getFlake "path:${builtins.toString inputs.self}").inputs.nixpkgs {}'';
              nixdExtras.nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self}").nixosConfigurations.${hostname}.options'';
              nixdExtras.home_manager_options = ''(builtins.getFlake "path:${builtins.toString inputs.self}").homeConfigurations.${username}.options'';

              nixdExtras.nvim_lspconfig = "${pkgs.vimPlugins.nvim-lspconfig}";
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
