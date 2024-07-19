# Nixos

My personal nixos configuration.

# [modules](/modules)

Breakdown of the included modules.

## [home-manager](/modules/home-manager) - Home Manager modules

- [neovim](/modules/home-manager/neovim) - Add neovim (configured in lua using [Lazy](https://github.com/folke/lazy.nvim))
    - enable `boolean` - Enables the module
- [toolchains](/module/home-manager/toolchains) - Toolchains submodule
  - [fzf](/module/home-manager/toolchains/c-cpp.nix) - Install c/c++ toolchain
    - enable `boolean` - Enables the module
- [utils](/module/home-manager/utils) - CLI utils submodule
  - [fzf](/module/home-manager/utils/fzf.nix) - Install fzf
    - enable `boolean` - Enables the module
  - [utils](/module/home-manager/utils/ripgrep.nix) - Install ripgrep
    - enable `boolean` - Enables the module
- [aliases](/module/home-manager/aliases.nix) - Define shell aliases
- [terminal](/module/home-manager/terminal.nix) - Configure terminal
  - enable `boolean` - Enables the module
- [tmux](/module/home-manager/tmux.nix) - Configure tmux
  - enable `boolean` - Enables the module
- [zsh](/module/home-manager/zsh.nix) - Configure zsh
  - enable `boolean` - Enables the module
  - zoxide.enable `boolean` - Enables zoxide

## [nixos](/modules/nixos) - Nixos modules

- [users](/modules/nixos/users.nix) - Create default user
  - enable `boolean` - Enables the module
  - zsh.enable `boolean` - Enables zsh as the default shell (must be done at the system level)
- [vcs](/modules/nixos/vcs.nix) - Install git
  - enable `boolean` - Enables the module

