{ pkgs, hyprland, networkmanager-nixpkgs, ... }:
{
  imports = [
    ./thunar
    hyprland.nixosModules.default
    ./syncthing.nix
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

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" ];
      allowed-users = [ "*" ];
      binary-caches = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      binary-cache-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
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
    "steam-run"
    "steam-original"
    "steam-runtime"
  ];

  time.timeZone = "America/New_York";

  users.users = {
    josh = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "kvm" "docker" ];
      uid = 1000;
      initialPassword = "josh";
    };
  };
  
  programs.xonsh = {
    enable = true;
  };
  
  programs.zsh = {
    enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
}
