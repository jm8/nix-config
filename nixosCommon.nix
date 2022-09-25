{ pkgs, hyprland, ... }:
{
  imports = [
    ./thunar/default.nix
    hyprland.nixosModules.default
    { programs.hyprland.enable = true; }
    { virtualisation.podman.enable = true; }
    {
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
    }
  ];
}
