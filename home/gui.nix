{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    audacity
    inkscape
    element-desktop-wayland
    (with eclipses; eclipseWithPlugins {
      eclipse = eclipse-java;
      jvmArgs = [ "-Dswt.autoScale=100" "--add-opens=java.base/java.lang=ALL-UNNAMED" ];
      plugins = [
        plugins.checkstyle
        plugins.spotbugs
        # (plugins.buildEclipseUpdateSite rec {
        #   name = "subclipse-${version}";
        #   version = "4.3.0";
        #   src = fetchzip {
        #     stripRoot = false;
        #     url = "https://subclipse.github.io/updates/subclipse/subclipse-${version}.zip";
        #     sha256 = "sha256-9N4tuvh/ByhwC/nFDQO/Ow0FDq15vw/XWMxOrY7Y36Y=";
        #   };
        # })
      ];
    })
    chromium
    zoom-us
    vlc
    ffmpeg
    musescore
    prismlauncher
    lapce
  ];
}
