{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.impermanence.enable {
    home.file.".local/bin/persist" = {
      executable = true;
      source = ./persist.sh;
    };

    home.shellAliases.persist = "sudo $HOME/.local/bin/persist";
  };
}

