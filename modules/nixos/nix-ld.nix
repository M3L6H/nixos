{ config, lib, ... }: {
  options = {
    nix-ld.enable = lib.mkEnableOption "enables nix-ld module";
  };

  config = lib.mkIf config.nix-ld.enable {
    programs.nix-ld.enable = true;
  };
}

