{ config, inputs, lib, ... }: {
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim module";
  };

  config = lib.mkIf config.neovim.enable {
    # We require the c/c++ toolchain for fzf in telescope
    toolchains.c-cpp.enable = true;

    # We require the following toolchains for Mason
    toolchains.go.enable = true;
    toolchains.node.enable = true;
    toolchains.python.enable = true;

    # We require the unzip utility for Mason
    utils.unzip.enable = true;

    # Ripgrep is required for grep search in telescope
    utils.ripgrep.enable = true;

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
      ${builtins.readFile ./autocmds.lua}
      '';
    };

    home.file.".config/nvim/lua/plugins".source = ./plugins;

    home.shellAliases.v = "nvim";
  };
}

