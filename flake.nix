{
  description = "Home of Artemis";

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

    # Pinning to v0.39.1 for now, since v0.40.0 introduced submodules, and
    # until https://github.com/NixOS/nix/pull/10125 is merged, flake does not
    # appear to parse submodules args correctly
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?ref=refs%2Ftags%2Fv0.39.1";
    hyprland-plugins = {
      url = "git+https://github.com/hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { nixpkgs, home-manager, flake-parts, ... }@inputs:
  let
    device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_4TB_S757NS0X302547W";
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
          specialArgs = { inherit device inputs username; };
          modules = [
	    inputs.disko.nixosModules.default
	    (import ./disko.nix { inherit device; })

	    ./configs/nixos/configuration.nix

	    inputs.impermanence.nixosModules.impermanence
	  ];
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

