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
    nerd-fonts.iosevka
    libre-baskerville
    open-sans

    # (config.lib.nixGL.wrap godot_4)
    # (config.lib.nixGL.wrap pcsx2)
    # (config.lib.nixGL.wrap prismlauncher)
    audacity
    # beekeeper-studio
    blender
    (config.lib.nixGL.wrap calibre)
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
    mpv
    kodi
    aria2
    reaper
    onboard
    # krita
    runelite
    clonehero
    zed-editor
  ];
}
