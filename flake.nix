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
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."josh@joshframework" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./cli.nix
          ./gui.nix
          ./helix/default.nix
          ./hyprland/default.nix
          ./kitty/default.nix
          ./waybar/default.nix
          ./cursor/default.nix
          ./rofi/default.nix
          ./xdg.nix
          hyprland.homeManagerModules.default
        ];
      };
      nixosConfigurations.joshframework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          hyprland.nixosModules.default
          { programs.hyprland.enable = true; }
        ];
      };
    };
}
