{ ... }:
{
  config = {
    utils.expect.enable = true; # We use unbuffer from expect

    home.file.".local/bin/home-manager-wrapper" = {
      executable = true;
      source = ./home-manager-wrapper.sh;
    };
  };
}
