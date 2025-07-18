{ config, lib, ... }: {
  config = lib.mkIf config.impermanence.enable {
    home.file.".local/bin/fs-diff" = {
      executable = true;
      source = ./fs-diff.sh;
    };

    home.shellAliases.root-diff = "sudo $HOME/.local/bin/fs-diff /mnt/@";
  };
}

