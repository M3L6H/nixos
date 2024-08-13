{ config, lib, ... }: {
  options = {
    neovim.plugins.mason.enable = lib.mkEnableOption "enables mason modules";
  };

  config = lib.mkIf config.neovim.plugins.mason.enable {
    home.file.".config/nvim/lua/plugins/mason.lua".source = ./mason.lua;

    # We require the following toolchains for Mason
    toolchains.go.enable = true;
    toolchains.node.enable = true;
    toolchains.python.enable = true;

    # We require the unzip utility for Mason
    utils.unzip.enable = true;
  };
}

