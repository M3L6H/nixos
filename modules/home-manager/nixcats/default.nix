{ config, lib, inputs, ... }: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];

  options = {
    nixcats.enable = lib.mkEnableOption "enables nixcats-nvim";
  };

  config = {
    nixCats = {
      enable = config.nixcats.enable;

      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];

      packageNames = [ "neovim" ];

      luaPath = ./.;

      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = {
          lua = with pkgs; [
            lua-language-server
            stylua
          ];
        };
      });

      packageDefinitions.replace = {
        neovim = {pkgs, name, ... }: {
          # they contain a settings set defined above
          # see :help nixCats.flake.outputs.settings
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            # unwrappedCfgPath = "/path/to/here";
            # IMPORTANT:
            # your alias may not conflict with your other packages.
            aliases = [ "nixcats" ];
            # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
            hosts.python3.enable = true;
            hosts.node.enable = true;
          };
          # and a set of categories that you want
          # (and other information to pass to lua)
          # and a set of categories that you want
          categories = {
            general = true;
            lua = true;
            nix = true;
          };
          # anything else to pass and grab in lua with `nixCats.extra`
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
