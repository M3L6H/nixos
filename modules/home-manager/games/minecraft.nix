{ config, lib, pkgs, username, ... }: {
  options = {
    games.minecraft.enable = lib.mkEnableOption "enables minecraft module";
  };

  config = let
    # Prismlauncher theme
    prismlauncher-tokyonight = pkgs.stdenv.mkDerivation {
      name = "prismlauncher-tokyonight";

      src = pkgs.fetchurl {
        url = "https://github.com/PrismLauncher/Themes/releases/latest/download/Tokyo-Night-theme.zip";
        hash = "sha256-DaDoYVMV4cNLXcRgsTb3u1yeMlToON5Byibr0o/2rzU=";
      };

      nativeBuildInputs = [ pkgs.unzip ];

      installPhase = ''
        mkdir -p "$out/prismlauncher-tokyonight"
        cp -a ./Tokyo-Night/. "$out/prismlauncher-tokyonight"
      '';
    };
  in
  lib.mkIf config.games.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
      prismlauncher-tokyonight
    ];

    home.file.".local/share/PrismLauncher/themes/tokyonight" = {
      source = "${prismlauncher-tokyonight}/prismlauncher-tokyonight";
    };

    home.persistence."/persist/home/${username}" = lib.mkIf config.impermanence.enable {
      directories = [
        ".local/share/PrismLauncher/assets"
        ".local/share/PrismLauncher/cache"
        ".local/share/PrismLauncher/catpacks"
        ".local/share/PrismLauncher/icons"
        ".local/share/PrismLauncher/instances"
        ".local/share/PrismLauncher/java"
        ".local/share/PrismLauncher/libraries"
        ".local/share/PrismLauncher/logs"
        ".local/share/PrismLauncher/meta"
        ".local/share/PrismLauncher/skins"
        ".local/share/PrismLauncher/translations"
      ];

      files = [
        ".local/share/PrismLauncher/accounts.json"
        ".local/share/PrismLauncher/metacache"
        ".local/share/PrismLauncher/prismlauncher.cfg"
      ];
    };
  };
}

