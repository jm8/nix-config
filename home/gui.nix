{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./vscode
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # fonts
    fontconfig
    nerd-fonts.jetbrains-mono
    libre-baskerville
    open-sans

    # (config.lib.nixGL.wrap godot_4)
    # (config.lib.nixGL.wrap pcsx2)
    # (config.lib.nixGL.wrap prismlauncher)
    # audacity
    # beekeeper-studio
    blender
    calibre
    chromium
    gimp3
    gnome-boxes
    gnome-shell-extensions
    gnome-tweaks
    gnomeExtensions.just-perfection
    inkscape
    lapce
    obs-studio
    vlc
    reaper
    onboard
    krita
    runelite
  ];
}
