{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap godot_4)
    # (config.lib.nixGL.wrap pcsx2)
    (config.lib.nixGL.wrap prismlauncher)
    audacity
    beekeeper-studio
    blender
    calibre
    chromium
    gimp
    gnome-boxes
    gnome-shell-extensions
    gnome-tweaks
    gnomeExtensions.just-perfection
    inkscape
    lapce
    obs-studio
    vlc
  ];
}
