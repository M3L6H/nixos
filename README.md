# Nixos

My personal nixos configuration.

## Installation

Boot into NixOS installer.

Close the installer.

Open a terminal and run the following:

```sh
sudo su
nix-shell -p git
git clone https://github.com/m3l6h/nixos.git
cd nixos
ls /dev/disk/by-id # Identify the disk to install NixOS on
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko.nix --arg device '"/dev/disk/by-id/<disk from previous step>"'
cd ..
mkdir /mnt/etc
mv nixos /mnt/etc/
nixos-install --root /mnt --flake /mnt/etc/nixos#nixos
reboot
```

Open a terminal and run the following:

```sh
home-manager switch --flake /etc/nixos#m3l6h
```

# [modules](/modules)

Breakdown of the included modules.

## [home-manager](/modules/home-manager) - Home Manager modules

- [neovim](/modules/home-manager/neovim) - Add neovim (configured in lua using [Lazy](https://github.com/folke/lazy.nvim))
    - neovim.enable `boolean` - Enables the module
- [scripts](/modules/home-manager/scripts) - Scripts submodule
  - [fs-diff](/modules/home-manager/scripts/fs-diff.nix) - Use to find files needing to be persisted
    - Will automatically be enabled if `impermanence.enable` is true
  - [wallpaper-haven](/modules/home-manager/scripts/wallpaper-haven.nix) - Sets a random wallpaper from wallpaper haven
    - scripts.wallpaper-haven.enable `boolean` - Enables the module
    - configure [api options](https://wallhaven.cc/help/api) with `~/.config/.wallhaven.ini`
- [software](/modules/home-manager/software) - Software submodule
  - [bazecor](/modules/home-manager/software/bazecor.nix) - Graphical configurator for Dygma products
    - software.bazecor.enable `boolean` - Enables the module
  - [digikam](/modules/home-manager/software/digikam) - Image management software
    - software.digikam.enable `boolean` - Enables the module
- [toolchains](/modules/home-manager/toolchains) - Toolchains submodule
  - [c-cpp](/modules/home-manager/toolchains/c-cpp.nix) - Install c/c++ toolchain
    - toolchains.c-cpp.enable `boolean` - Enables the module
  - [go](/modules/home-manager/toolchains/go.nix) - Install go toolchain
    - toolchains.go.enable `boolean` - Enables the module
  - [markdown](/modules/home-manager/toolchains/markdown.nix) - Install markdown toolchain
    - toolchains.markdown.enable `boolean` - Enables the module
  - [node](/modules/home-manager/toolchains/node.nix) - Install node toolchain
    - toolchains.node.enable `boolean` - Enables the module
  - [python](/modules/home-manager/toolchains/python.nix) - Install python toolchain
    - toolchains.python.enable `boolean` - Enables the module
- [utils](/modules/home-manager/utils) - CLI utils submodule
  - [file](/modules/home-manager/utils/file.nix) - Install file
    - utils.file.enable `boolean` - Enables the module
  - [fzf](/modules/home-manager/utils/fzf.nix) - Install fzf
    - utils.fzf.enable `boolean` - Enables the module
  - [image-magick](/modules/home-manager/utils/image-magick.nix) - Install the image-magick suite
    - utils.image-magick.enable `boolean` - Enables the module
  - [jq](/modules/home-manager/utils/jq.nix) - Install jq
    - utils.jq.enable `boolean` - Enables the module
  - [ripgrep](/modules/home-manager/utils/ripgrep.nix) - Install ripgrep
    - utils.ripgrep.enable `boolean` - Enables the module
  - [parted](/modules/home-manager/utils/parted.nix) - Install parted
    - utils.parted.enable `boolean` - Enables the module
  - [unzip](/modules/home-manager/utils/unzip.nix) - Install unzip
    - utils.unzip.enable `boolean` - Enables the module
- [aliases](/modules/home-manager/aliases.nix) - Define shell aliases
- [impermanence](/modules/home-manager/impermanence.nix) - Enables impermanence at user level
  - impermanence.enable `boolean` - Enables the module
- [terminal](/modules/home-manager/terminal.nix) - Configure terminal
  - terminal.enable `boolean` - Enables the module
- [tmux](/modules/home-manager/tmux.nix) - Configure tmux
  - tmux.enable `boolean` - Enables the module
- [user-dirs](/modules/home-manager/user-dirs.nix) - Custom user dirs
  - user-dirs.enable `boolean` - Enables the module
- [zsh](/modules/home-manager/zsh.nix) - Configure zsh
  - zsh.enable `boolean` - Enables the module
  - zsh.zoxide.enable `boolean` - Enables zoxide

## [nixos](/modules/nixos) - Nixos modules

- [firefox](/modules/nixos/firefox.nix) - Enables firefox browser
  - firefox.enable `boolean` - Enables the module
- [hyprland](/modules/nixos/hyprland.nix) - Enables hyprland window manager
  - hyprland.enable `boolean` - Enables the module
- [impermanence](/modules/nixos/impermanence.nix) - Enables impermanence at system level
  - impermanence.enable `boolean` - Enables the module
- [nix-ld](/modules/nixos/nix-ld.nix) - Enables nix-ld for executing arbitrary binaries
  - nix-ld.enable `boolean` - Enables the module
- [nvidia](/modules/nixos/nvidia.nix) - Enables nvidia window manager
  - nvidia.enable `boolean` - Enables the module
- [partition-manager](/modules/nixos/partition-manager.nix) - Install partition-manager
  - partition-manager.enable `boolean` - Enables the module
- [sddm](/modules/nixos/sddm.nix) - Enables sddm window manager
  - sddm.enable `boolean` - Enables the module
- [users](/modules/nixos/users.nix) - Create default user
  - users.enable `boolean` - Enables the module
  - users.zsh.enable `boolean` - Enables zsh as the default shell (must be done at the system level)
- [vcs](/modules/nixos/vcs.nix) - Install git
  - vcs.enable `boolean` - Enables the module

