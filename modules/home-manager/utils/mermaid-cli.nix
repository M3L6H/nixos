{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    utils.mermaid-cli.enable = lib.mkEnableOption "enables mermaid-cli module";
  };

  config = lib.mkIf config.utils.mermaid-cli.enable {
    home.packages = with pkgs; [
      mermaid-cli
    ];
  };
}
