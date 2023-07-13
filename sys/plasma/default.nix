{pkgs, ...}:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.bismuth
  ];
}