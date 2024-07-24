# Nixos

My personal nixos configuration.

# [modules](/modules)

Breakdown of the included modules.

## [home-manager](/modules/home-manager) - Home Manager modules

- [neovim](/modules/home-manager/neovim) - Add neovim (configured in lua using [Lazy](https://github.com/folke/lazy.nvim))
    - neovim.enable `boolean` - Enables the module
- [scripts](/modules/home-manager/scripts) - Scripts submodule
  - [wallpaper-haven](/modules/home-manager/scripts/wallpaper-haven.nix) - Sets a random wallpaper from wallpaper haven
    - scripts.wallpaper-haven.enable `boolean` - Enables the module
    - configure [api options](https://wallhaven.cc/help/api) with `~/.config/.wallhaven.ini`
- [software](/modules/home-manager/software) - Software submodule
  - [bazecor](/modules/home-manager/software/bazecor.nix) - Graphical configurator for Dygma products
    - software.bazecor.enable `boolean` - Enables the module
- [toolchains](/modules/home-manager/toolchains) - Toolchains submodule
  - [c-cpp](/modules/home-manager/toolchains/c-cpp.nix) - Install c/c++ toolchain
    - toolchains.c-cpp.enable `boolean` - Enables the module
  - [go](/modules/home-manager/toolchains/go.nix) - Install go toolchain
    - toolchains.go.enable `boolean` - Enables the module
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
  - [unzip](/modules/home-manager/utils/unzip.nix) - Install unzip
    - utils.unzip.enable `boolean` - Enables the module
- [aliases](/modules/home-manager/aliases.nix) - Define shell aliases
- [terminal](/modules/home-manager/terminal.nix) - Configure terminal
  - terminal.enable `boolean` - Enables the module
- [tmux](/modules/home-manager/tmux.nix) - Configure tmux
  - tmux.enable `boolean` - Enables the module
- [zsh](/modules/home-manager/zsh.nix) - Configure zsh
  - zsh.enable `boolean` - Enables the module
  - zsh.zoxide.enable `boolean` - Enables zoxide

## [nixos](/modules/nixos) - Nixos modules

- [nix-ld](/modules/nixos/nix-ld.nix) - Enables nix-ld for executing arbitrary binaries
  - nix-ld.enable `boolean` - Enables the module
- [users](/modules/nixos/users.nix) - Create default user
  - users.enable `boolean` - Enables the module
  - users.zsh.enable `boolean` - Enables zsh as the default shell (must be done at the system level)
- [vcs](/modules/nixos/vcs.nix) - Install git
  - vcs.enable `boolean` - Enables the module

