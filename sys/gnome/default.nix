{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  programs.dconf.enable = true;
  services.dbus.enable = true;

  nixpkgs.config.firefox.enableGnomeExtensions = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.material-shell
    gnomeExtensions.unite
  ];
}
