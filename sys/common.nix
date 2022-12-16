{ pkgs, hyprland, networkmanager-nixpkgs, ... }:
{
  imports = [
    ./thunar
    hyprland.nixosModules.default
    ./syncthing.nix
    ./cachix.nix
  ];

  programs.hyprland.enable = true;

  virtualisation.podman.enable = true;

  virtualisation.docker.enable = true;

  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    pulseaudio
    docker-compose
    starship
  ];

  nix.trusted-users = [ "root" "josh" ];
  package = pkgs.nixUnstable;
  extraOptions = ''
    # enable the new standalone nix commands
    experimental-features = nix-command flakes

    # allow rebuild while offline
    # https://nixos.org/manual/nix/stable/package-management/garbage-collection.html
    keep-outputs = true
    keep-derivations = true

    accept-flake-config = true
    warn-dirty = false
  '';
  gc = {
    automatic = true;
    dates = "weekly";
    options = "";
  };

  programs.steam.enable = true;

  programs.dconf.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
    };
    pulse.enable = true;
  };
  services.dbus.enable = true;

  hardware.pulseaudio.enable = false;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "steam"
    "steam-original"
    "steam-runtime"
  ];

  time.timeZone = "America/New_York";

  users.users = {
    josh = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "kvm" "docker" ];
      uid = 1000;
      hashedPassword = "$6$4vtL8Do8lVPwnN9o$z2ub/5/28W/HBRyRG0aZcd3IoesQEHhRXKmiDjxxO7lI.XpCjwIpE/z1oP3prwd8eLE88EMdzzhWEjvJOb5Bz0";
    };
  };
  
  programs.xonsh = {
    enable = true;
  };
  
  programs.zsh = {
    enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  nixpkgs.overlays = [
    (final: prev:
      let nmpkgs = networkmanager-nixpkgs.legacyPackages.x86_64-linux;
      in
      {
        networkmanager = nmpkgs.networkmanager;
        wpa_supplicant = nmpkgs.wpa_supplicant;
        webkitgtk = nmpkgs.webkitgtk;
      })
  ];
}
