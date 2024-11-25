{
  pkgs,
  networkmanager-nixpkgs,
  ...
}: {
  virtualisation.podman.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;

  programs.singularity.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    pulseaudio
    docker-compose
    starship
    adw-gtk3
    adwaita-qt
    openconnect
  ];

  nix.settings.trusted-users = ["root" "josh"];
  nix.extraOptions = ''
    # enable the new standalone nix commands
    experimental-features = nix-command flakes

    # allow rebuild while offline
    # https://nixos.org/manual/nix/stable/package-management/garbage-collection.html
    keep-outputs = true
    keep-derivations = true

    accept-flake-config = true
    warn-dirty = false
  '';
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "";
  };

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
    };
    pulse.enable = true;
  };

  hardware.pulseaudio.enable = false;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
    ];
  };

  services.printing.browsing = true;
  services.printing.browsedConf = ''
    BrowseDNSSDSubTypes _cups,_print
    BrowseLocalProtocols all
    BrowseRemoteProtocols all
    CreateIPPPrinterQueues All

    BrowseProtocols all
  '';
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-run"
      "steam-original"
      "steam-runtime"
      "steam-run"
      "nvidia-persistenced"
      "zoom"
    ];

  time.timeZone = "America/New_York";

  users.users = {
    josh = {
      isNormalUser = true;
      extraGroups = ["wheel" "libvirtd" "kvm" "docker" "adbusers"];
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

  services.tailscale.enable = true;

  users.defaultUserShell = pkgs.zsh;

  boot.supportedFilesystems = ["ntfs"];

  programs.adb.enable = true;

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  programs.dconf.enable = true;
  services.dbus.enable = true;

  nixpkgs.config.firefox.enableGnomeExtensions = true;
}
