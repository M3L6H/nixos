{ ... }:
{
  config = {
    home.file.".local/bin/nix-rebuild-wrapper.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

        INSOMNIA="$([ -f "$HOME/.local/state/no-suspend" ] && echo 'true' || echo 'false')"

        # Don't lock while I'm trying to rebuild
        touch "$HOME/.local/state/no-lock"

        # Don't suspend while I'm trying to rebuild
        touch "$HOME/.local/state/no-suspend"

        sudo nixos-rebuild-ng switch --flake /etc/nixos#nixos "$@" |& tee /tmp/build.log

        if ! "$INSOMNIA"; then
          rm -f "$HOME/.local/state/no-suspend"
        fi
      '';
    };

    home.shellAliases = {
      dream = "echo 'Sweet dreams...'; rm -f $HOME/.local/state/no-suspend";
      gds = "git diff --staged";
      gs = "git status";
      hms = "home-manager switch --flake /etc/nixos#m3l6h";
      icat = "kitten icat";
      insomnia = "echo 'Having nightmares...'; touch $HOME/.local/state/no-suspend";
      maxvol = "pactl set-sink-volume @DEFAULT_SINK@ 100%";
      mntimp = "sudo mkdir /mnt >/dev/null 2>&1; sudo mount -o subvol=/ /dev/mapper/root /mnt";
      nxs = "/home/m3l6h/.local/bin/nix-rebuild-wrapper.sh";
      src = "omz reload";
      tsrc = "tmux source /home/m3l6h/.config/tmux/tmux.conf";
    };
  };
}
