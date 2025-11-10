{

	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

		home-manager = {
			url="github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ...}: 
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ ./nixos/configuration.nix];
		};

		homeConfigurations.ruslan = home-manager.lib.homeManagerConfiguration{
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home.nix];
		};
	};

}
