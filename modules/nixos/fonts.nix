{ pkgs, ... }:
{
  config = {
    fonts.packages = with pkgs; [
      victor-mono
    ];
  };
}
