{ ... }:
{
  config = {
    home.file.".local/bin/nix-rebuild-wrapper" = {
      executable = true;
      source = ./nix-rebuild-wrapper.sh;
    };
  };
}
