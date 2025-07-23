{ ... }:
{
  config = {
    home.file.".local/bin/home-manager-wrapper" = {
      executable = true;
      source = ./home-manager-wrapper.sh;
    };
  };
}
