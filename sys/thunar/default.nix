{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    ffmpegthumbnailer
    evince
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
