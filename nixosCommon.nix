{ pkgs, hyprland, ... }:
{
  imports = [
    ./thunar/default.nix
    hyprland.nixosModules.default
    { programs.hyprland.enable = true; }
    { virtualisation.podman.enable = true; }
  ];
}
