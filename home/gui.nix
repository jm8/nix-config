{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    inkscape
    element-desktop-wayland
    eclipses.eclipse-java
  ];
}
