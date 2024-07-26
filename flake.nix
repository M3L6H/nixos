{
  description = "Home of Artemis";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { nixpkgs, home-manager, flake-parts, ... }@inputs:
  let
    hostname = "nixos";
    system = "x86_64-linux";
    username = "m3l6h";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ system ];
    flake = {
      # NixOS configuration entrypoint
      # Available through 'sudo nixos-rebuild switch --flake .#hostname'
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username; };
          modules = [ ./configs/nixos/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager switch --flake .#username'
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs username; };
          modules = [ ./homes/m3l6h/home.nix ];
        };
      };
    };
  };
}

