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
    nix-qml-support = {
      url = "git+https://git.outfoxxed.me/outfoxxed/nix-qml-support";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri,
      quickshell,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations."nixos-desktop" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-desktop/configuration.nix
          ./hosts/nixos-desktop/stylix.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
