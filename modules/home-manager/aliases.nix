{ ... }: {
  config = {
    home.shellAliases = {
      dream = "echo 'Sweet dreams...'; systemctl --user start hypridle.service";
      gds = "git diff --staged";
      gs = "git status";
      hms = "home-manager switch --flake /etc/nixos#m3l6h";
      icat = "kitten icat";
      insomnia = "echo 'Having nightmares...'; systemctl --user stop hypridle.service";
      maxvol = "pactl set-sink-volume @DEFAULT_SINK@ 100%";
      mntimp = "sudo mkdir /mnt >/dev/null 2>&1; sudo mount -o subvol=/ /dev/mapper/root /mnt";
      nxs = "sudo nixos-rebuild-ng switch --flake /etc/nixos#nixos |& tee /tmp/build.log";
      protontricks = "cd ~; protontricks";
      src = "omz reload";
      tsrc = "tmux source /home/m3l6h/.config/tmux/tmux.conf";
    };
  };
}

