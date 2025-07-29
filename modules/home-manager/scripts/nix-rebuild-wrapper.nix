{ ... }:
{
  config = {
    utils.expect.enable = true; # We use unbuffer from expect

    home.file.".local/bin/nix-rebuild-wrapper" = {
      executable = true;
      source = ./nix-rebuild-wrapper.sh;
    };
  };
}
