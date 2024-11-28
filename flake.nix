{
  description = "josh's home";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL";
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
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-index-database,
    networkmanager-nixpkgs,
    nixGL,
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
        (
          final: prev: let
            nmpkgs = networkmanager-nixpkgs.legacyPackages.x86_64-linux;
          in {
            inherit (nmpkgs) wpa_supplicant;
          }
        )
      ];
    };
  in {
    homeConfigurations."josh@stryver" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = attrs;
      modules = [
        ./home
        ./home/gui.nix
        nix-index-database.hmModules.nix-index
        {home.username = "josh";}
        {home.stateVersion = "24.05";}
        {home.homeDirectory = "/var/home/josh";}
        {
          nixGL.packages = nixGL.packages;
        }
      ];
    };

    homeConfigurations."josh@darnay" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = attrs;
      modules = [
        ./home
        nix-index-database.hmModules.nix-index
        {home.username = "josh";}
        {home.stateVersion = "22.11";}
        {programs.firefox.enable = true;}
        {home.homeDirectory = "/home/josh";}
        {
          nixGL.packages = nixGL.packages;
          nixGL.defaultWrapper = "mesa";
        }
      ];
    };

    nixosConfigurations.darnay = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./sys/darnay.nix
        ./sys/common.nix
      ];
    };
  };
}
