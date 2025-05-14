{
  config,
  lib,
  hostname,
  inputs,
  pkgs,
  username,
  ...
}:
let
  colorscheme = "kanagawa";
  utils = inputs.nixCats.utils;

  demicolon =
    (pkgs.vimUtils.buildVimPlugin {
      pname = "demicolon.nvim";
      version = "2025-04-25";
      src = pkgs.fetchFromGitHub {
        owner = "mawkler";
        repo = "demicolon.nvim";
        rev = "8d79e527dbbef9de06405a30258b8d752c0638c4";
        hash = "sha256-UTzA9xX14zS6FV4g4HNWjyYyFPGE/Rc9dADa2+JFltU=";
      };
      meta.homepage = "https://github.com/mawkler/demicolon.nvim/";
    }).overrideAttrs
      {
        nvimSkipModules = [
          "demicolon.repeat_jump"
        ];
      };
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
    utils.ghostscript.enable = true; # Used by Snacks image module
    utils.image-magick.enable = true; # Used by Snacks image module
    utils.mermaid-cli.enable = true; # Used by Snacks image module
    utils.ripgrep.enable = true; # Used in picker
    utils.sqlite.enable = true; # Used in picker
    utils.tectonic.enable = true; # Used by Snacks image module

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
                demicolon
                flash-nvim
                guess-indent-nvim
                lazydev-nvim
                mini-diff
                mini-icons
                mini-statusline
                mini-surround
                noice-nvim
                nui-nvim
                nvim-autopairs
                nvim-lspconfig
                nvim-treesitter.withAllGrammars
                nvim-treesitter-textobjects
                nvim-web-devicons
                oil-nvim
                smartcolumn-nvim
                smear-cursor-nvim
                snacks-nvim
                trouble-nvim
                undotree
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
              nixdExtras.sqlite3_path = "${pkgs.sqlite.out}/lib/libsqlite3.so";
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
