# Nixos

My personal nixos configuration.

# [modules](/modules)

Breakdown of the included modules.

## [home-manager](/modules/home-manager) - Home Manager modules

- [neovim](/modules/home-manager/neovim) - Add neovim (configured in lua using [Lazy](https://github.com/folke/lazy.nvim))
    - neovim.enable `boolean` - Enables the module
- [scripts](/module/home-manager/scripts) - Scripts submodule
  - [wallpaper-haven](/module/home-manager/scripts/wallpaper-haven.nix) - Sets a random wallpaper from wallpaper haven
    - scripts.wallpaper-haven.enable `boolean` - Enables the module
- [toolchains](/module/home-manager/toolchains) - Toolchains submodule
  - [c-cpp](/module/home-manager/toolchains/c-cpp.nix) - Install c/c++ toolchain
    - toolchains.c-cpp.enable `boolean` - Enables the module
  - [python](/module/home-manager/toolchains/python.nix) - Install python toolchain
    - toolchains.python.enable `boolean` - Enables the module
- [utils](/module/home-manager/utils) - CLI utils submodule
  - [file](/module/home-manager/utils/file.nix) - Install file
    - utils.file.enable `boolean` - Enables the module
  - [fzf](/module/home-manager/utils/fzf.nix) - Install fzf
    - utils.fzf.enable `boolean` - Enables the module
  - [image-magick](/module/home-manager/utils/image-magick.nix) - Install the image-magick suite
    - utils.image-magick.enable `boolean` - Enables the module
  - [jq](/module/home-manager/utils/jq.nix) - Install jq
    - utils.jq.enable `boolean` - Enables the module
  - [ripgrep](/module/home-manager/utils/ripgrep.nix) - Install ripgrep
    - utils.ripgrep.enable `boolean` - Enables the module
- [aliases](/module/home-manager/aliases.nix) - Define shell aliases
- [terminal](/module/home-manager/terminal.nix) - Configure terminal
  - terminal.enable `boolean` - Enables the module
- [tmux](/module/home-manager/tmux.nix) - Configure tmux
  - tmux.enable `boolean` - Enables the module
- [zsh](/module/home-manager/zsh.nix) - Configure zsh
  - zsh.enable `boolean` - Enables the module
  - zsh.zoxide.enable `boolean` - Enables zoxide

## [nixos](/modules/nixos) - Nixos modules

- [users](/modules/nixos/users.nix) - Create default user
  - users.enable `boolean` - Enables the module
  - users.zsh.enable `boolean` - Enables zsh as the default shell (must be done at the system level)
- [vcs](/modules/nixos/vcs.nix) - Install git
  - vcs.enable `boolean` - Enables the module

