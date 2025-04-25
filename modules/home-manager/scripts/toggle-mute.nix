{ config, lib, ... }: {
  config = lib.mkIf config.utils.playerctl.enable {
    home.file.".local/bin/toggle-mute" = {
      executable = true;
      source = ./toggle-mute.sh;
    };

    home.shellAliases.toggle-mute = "$HOME/.local/bin/toggle-mute.sh";
  };
}

