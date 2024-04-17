{
  pkgs,
  networkmanager-nixpkgs,
  nixpkgs,
  ...
}: {
  imports = [
    # ./kde
    ./gnome
    ./syncthing.nix
    ./cachix.nix
  ];

  virtualisation.podman.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;
  programs.singularity.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


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

  environment.variables.NO_AT_BRIDGE = "1";

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
  nix.registry = {
    nixpkgs.flake = nixpkgs;
    np.flake = nixpkgs;
  };

  programs.steam.enable = true;

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

  services.tailscale.enable = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;

  boot.supportedFilesystems = ["ntfs"];

  networking.hosts = {
    "10.10.0.237" = ["chall.pwnoh.io" "ohio-instruments-84.chall.pwnoh.io" "infinity.chall.pwnoh.io" "area51.chall.pwnoh.io" "sentiment.chall.pwnoh.io"];
  };

  networking.firewall.allowedTCPPorts = [
    1720
    5060
  ];

  programs.adb.enable = true;
}
