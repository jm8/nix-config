{
  description = "josh's home";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-zed = {
      url = "github:GaetanLepage/nixpkgs/zed";
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
    nix-analyzer = {
      url = "github:jm8/nix-analyzer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    canvas-cli = {
      url = "github:mbund/canvas-cli";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-index-database,
    networkmanager-nixpkgs,
    nixpkgs-zed,
    ...
  } @ attrs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfreePredicate = pkg:
        builtins.elem (nixpkgs.lib.getName pkg) [
          "zoom"
          "ngrok"
          "code"
          "vscode"
          "terraform"
        ];
      overlays = [
        (final: prev: let
          nmpkgs = networkmanager-nixpkgs.legacyPackages.x86_64-linux;
          zedpkgs = nixpkgs-zed.legacyPackages.x86_64-linux;
        in {
          inherit (nmpkgs) wpa_supplicant;
          inherit (zedpkgs) zed-editor;
        })
      ];
    };
  in {
    homeConfigurations."josh@joshframework" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = attrs;
      modules = [
        ./home
        nix-index-database.hmModules.nix-index
      ];
    };

    homeConfigurations."josh@joshnix" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = attrs;
      modules = [
        ./home
        nix-index-database.hmModules.nix-index
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
