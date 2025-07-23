{ ... }:
{
  config = {
    home.shellAliases = {
      dream = "echo 'Sweet dreams...'; rm -f $HOME/.local/state/no-suspend";
      gds = "git diff --staged";
      gs = "git status";
      hms = "/home/m3l6h/.local/bin/home-manager-wrapper";
      icat = "kitten icat";
      insomnia = "echo 'Having nightmares...'; touch $HOME/.local/state/no-suspend";
      maxvol = "pactl set-sink-volume @DEFAULT_SINK@ 100%";
      mntimp = "sudo mkdir /mnt >/dev/null 2>&1; sudo mount -o subvol=/ /dev/mapper/root /mnt";
      nxs = "/home/m3l6h/.local/bin/nix-rebuild-wrapper";
      src = "omz reload";
      tsrc = "tmux source /home/m3l6h/.config/tmux/tmux.conf";
    };
  };
}
