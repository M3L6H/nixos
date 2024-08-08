{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs:
  let
    device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_4TB_S757NS0X302547W";
    user = "m3l6h";
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit device;
        inherit inputs;
	inherit user;
      };
      modules = [
        inputs.disko.nixosModules.default
        (import ./disko.nix { inherit device; })

        ./configs/nixos/configuration.nix

        inputs.home-manager.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
      ];
    };
  };
}

