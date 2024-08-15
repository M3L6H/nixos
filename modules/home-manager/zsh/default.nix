{ config, lib, pkgs, username, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh module";
    zsh.zoxide.enable = lib.mkEnableOption "enables zoxide";
  };

  imports = [
    ./zsh-vi-mode.nix
  ];

  config = let
    custom = "$HOME/.zsh-custom";
  in lib.mkIf config.zsh.enable {
    zsh.vi-mode.enable = lib.mkDefault true;
    zsh.zoxide.enable = lib.mkDefault true;

    home.packages = [ pkgs.spaceship-prompt ];

    programs.zoxide.enable = config.zsh.zoxide.enable;

    home.persistence."/persist/home/${username}".directories = lib.mkIf config.impermanence.enable [
      ".local/share/zoxide"
    ];

    home.file.".zsh-custom/themes/spaceship.zsh-theme" = {
      recursive = true;
      source = "${pkgs.spaceship-prompt}/lib/spaceship-prompt/spaceship.zsh";
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;

      envExtra = ''
      ${if config.tmux.enable then "export ZSH_TMUX_AUTOSTART=true" else ""}
      ${if config.zsh.vi-mode.enable then "ZVM_VI_SURROUND_BINDKEY='s-prefix'" else ""}
      ${if config.zsh.zoxide.enable then "export ZOXIDE_CMD_OVERRIDE='cd'" else ""}
      '';

      history = {
        expireDuplicatesFirst = true;
      };

      initExtra = ''
      # Allow execution of arbitrary binaries downloaded through channels such as mason
      # export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')

      ${if config.zsh.vi-mode.enable then "source $HOME/.zsh-custom/my-custom/zsh-vi-mode.sh" else ""}

      ${if config.scripts.wallpaper-haven.enable then "# Load a random wallpaper from wallpaper haven" else ""}
      ${if config.scripts.wallpaper-haven.enable then "(&>/dev/null $HOME/.local/bin/wallpaper-haven &)" else ""}
      '';

      oh-my-zsh = {
        enable = true;
        inherit custom;
        plugins = [
          "git"
        ] ++ lib.optionals (config.tmux.enable) [
          "tmux"
        ] ++ lib.optionals (config.zsh.zoxide.enable) [
          "zoxide"
        ];
        theme = "spaceship";
      };
    };
  };
}

