{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    software.obs.enable = lib.mkEnableOption "enables obs module";
  };

  config = lib.mkIf config.software.obs.enable {
    programs.obs-studio = {
      enable = true;

      # Nvidia hardware acceleration
      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );

      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
