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
    };

    home.shellAliases.v = "nvim";
  };
}

