{ config, lib, pkgs, ... }: {
  options = {
    editor.enable = lib.mkEnableOption "enables editor module";
  };

  config = lib.mkIf config.editor.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];
  };
}
