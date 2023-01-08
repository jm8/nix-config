{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    audacity
    inkscape
    element-desktop-wayland
    eclipses.eclipse-java
    chromium
    zoom-us
    vlc
    ffmpeg
    prismlauncher
    lapce
  ];
}
