({ pkgs, ... }:
  {
    imports = [
      ./hardware-configuration.nix
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

    environment.systemPackages = with pkgs; [
      git
      vim
      pulseaudio
    ];
    
    environment.variables = {
      CLUTTER_BACKEND = "wayland";
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      __GLX_VENDOR_LIBRARY = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_BACKEND = "vulkan";
      QT_QPA_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
    };

    networking = {
      hostName = "joshnix";
      useDHCP = false;
      networkmanager.enable = true;
    };

    time.timeZone = "America/New_York";

    users.users = {
      josh = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" "kvm" "docker" ];
        uid = 1000;
        initialPassword = "josh";
      };
    };

    hardware.pulseaudio.enable = false;

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-original"
      "steam-runtime"
    ];

    # services.xserver = {
    #   enable = true;
    #   videoDrivers = [ "nvidia" ];
    #   # displayManager.defaultSession = "none+i3";
    #   # displayManager.sddm = {
    #   #   enable = true;
    #   #   autoNumlock = true;
    #   # };

    #   # desktopManager = {
    #   #   xterm.enable = false;
    #   # };

    #   # windowManager.i3 = {
    #   #   enable = false;
    #   #   extraPackages = with pkgs; [
    #   #     # dmenu
    #   #     rofi
    #   #     i3status
    #   #     i3lock
    #   #     i3blocks
    #   #   ];
    #   # };

    #   layout = "us,gr";
    #   xkbVariant = ",polytonic";
    #   xkbOptions = "grp:win_space_toggle";
    # };

    services.printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
      ];
    };

    services.deluge = {
      enable = true;
    };

    # auto detecting printers
    # services.avahi.enable = true;
    # services.avahi.nssmdns = true;

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
    };
    programs.steam.enable = true;

    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    programs.dconf.enable = true;

    programs.hyprland.enable = true;

    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true; # this is probably not necessary
      };
      pulse.enable = true;
    };

    virtualisation.libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.runAsRoot = false;
    };

    # Docker
    virtualisation.docker.enable = true;

    # environment.erasure."root" = {
    #   storage-path = "/persist";

    #   btrfs = {
    #     enable = true;
    #     device = "/dev/mapper/nixos-root";
    #     subvolume = "root";
    #     mountpoint = "/";
    #     rollback-snapshot = "root-blank";
    #   };

    #   paths = [
    #     "/etc/machine-id"
    #     "/etc/NetworkManager/system-connections/"
    #     "/etc/nixos/"
    #     "/etc/cups/"
    #     # "/etc/passwd"
    #     "/var/lib/docker/"
    #     "/var/lib/libvirt/"
    #   ];

    #   ignore = [
    #     "^/tmp/.*$"
    #     "^/var/lib/nixos/.*$"
    #     "^/var/lib/NetworkManager/.*$"
    #     "^/etc/NetworkManager/.*$"
    #     "^/root/.cache/.*$"
    #     "^/var/lib/systemd/.*$"
    #     "^/var/cache/.*$"
    #     "^/var/lib/sddm/\\.cache/.*$"
    #     "^/etc/pam\\.d/.*$"
    #     "^/etc/tmpfiles\\.d/.*$"
    #   ];
    # };
    
    systemd.enableEmergencyMode = false;

    systemd.extraConfig = ''
      # this isn't some super powerful server running a million things, a service will
      # either stop in milliseconds or fail so the default 90s is way too long
      DefaultTimeoutStopSec=10s
      DefaultTimeoutStartSec=10s
    '';

    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    system = {
      # Copy over full nixos-config to `/var/run/current-system/full-config/`
      # (available to the currently active derivation for safety/debugging)
      extraSystemBuilderCmds = "cp -rf ${./.} $out/full-config";

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      stateVersion = "21.11"; # Did you read the comment?
    };

  }
)
