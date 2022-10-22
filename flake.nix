{
  description = "josh's home";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    networkmanager-nixpkgs = {
      url = "github:NixOS/nixpkgs/22.05";
    };
    nix-godot = {
      url = "github:jm8/nix-godot";
    };
    nix-analyzer = {
      url = "/home/josh/dev/nix-analyzer";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@attrs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."josh@joshframework" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = attrs;
        modules = [
          ./home.nix
        ];
      };

      homeConfigurations."josh@joshnix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = attrs;
        modules = [
          ./home.nix
        ];
      };

      nixosConfigurations.joshframework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./hosts/joshframework/configuration.nix
          ./nixosCommon.nix
        ];
      };

      nixosConfigurations.joshnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./hosts/joshnix/configuration.nix
          ./nixosCommon.nix
        ];
      };
    };
}
