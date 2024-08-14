{
  home.shellAliases = {
    gds = "git diff --staged";
    gs = "git status";
    hms = "home-manager switch --flake /etc/nixos#m3l6h";
    icat = "kitten icat";
    mntimp = "sudo mkdir /mnt; sudo mount -o subvol=/ /dev/mapper/root /mnt";
    nxs = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
  };
}

