{
  description = "portable dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, niri, quickshell, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations."nixos-desktop" = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos-desktop/configuration.nix
        niri.nixosModules.niri
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
      ];
    };

    homeConfigurations."so" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home/common.nix
        niri.homeModules.niri
        stylix.homeModules.stylix
      ];
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
