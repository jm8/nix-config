({ pkgs, ... }:
  {
    imports = [
      ./hardware-configuration.nix
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

    networking.hostName = "joshnix"; 

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
