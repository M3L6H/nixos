{ config, inputs, lib, ... }: {
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim module";
  };

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = ''
      ${builtins.readFile ./lazy-bootstrap.lua}
      ${builtins.readFile ./opts.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./lazy-setup.lua}
      '';
    };

    home.file.".config/nvim/lua/plugins".source = ./plugins;

    home.shellAliases.v = "nvim";
  };
}

