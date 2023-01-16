{
  description = "josh's home";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
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
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@attrs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
           "zoom"
           "ngrok"
           "code"
           "vscode"
         ];
      };
    in
    {
      homeConfigurations."josh@joshframework" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = attrs;
        modules = [
          ./home
        ];
      };

      homeConfigurations."josh@joshnix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = attrs;
        modules = [
          ./home
        ];
      };

      nixosConfigurations.joshframework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./sys/joshframework.nix
          ./sys/common.nix
        ];
      };

      nixosConfigurations.joshnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./sys/joshnix.nix
          ./sys/common.nix
        ];
      };
    };
}
