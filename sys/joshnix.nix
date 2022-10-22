({ config, pkgs, lib, ... }:
  {
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

    # Partitioning and drives
    fileSystems = {
      "/" = {
        device = "/dev/mapper/nixos-root";
        fsType = "btrfs";
        options = [ "subvol=root" "compress=zstd" "noatime" ];
      };

      "/nix" = {
        device = "/dev/mapper/nixos-root";
        fsType = "btrfs";
        options = [ "subvol=nix" "compress=zstd" "noatime" ];
      };

      "/var/log" = {
        device = "/dev/mapper/nixos-root";
        fsType = "btrfs";
        options = [ "subvol=log" "compress=zstd" "noatime" ];
      };

      "/persist" = {
        device = "/dev/mapper/nixos-root";
        fsType = "btrfs";
        options = [ "subvol=persist" "compress=zstd" "noatime" ];
        neededForBoot = true;
      };

      "/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "ext4";
      };

      "/boot/efi" = {
        device = "/dev/disk/by-label/UEFI-ESP";
        fsType = "vfat";
      };

      "/swap" = {
        device = "/dev/mapper/nixos-root";
        fsType = "btrfs";
        options = [ "subvol=swap" "compress=none" "noatime" ];
      };

      "/home" = {
        device = "/dev/mapper/nixos-root";
        fsType = "btrfs";
        options = [ "subvol=home" "compress=zstd" ];
      };

      # "/mint" = {
      #   device = "/dev/sda1";
      #   options = [ "rw" "nofail" ];
      # };

      # "/winnew" = {
      #   options = [ "uid=1000" "gid=1000" "dmask=007" "fmask=117" "rw" "nofail" ];
      #   device = "/dev/sda3";
      # };

      # "/winold" = {
      #   options = [ "uid=1000" "gid=1000" "dmask=007" "fmask=117" "rw" "nofail" ];
      #   device = "/dev/sdc4";
      # };
    };

    # enable fstrim because I am running on an ssd
    services.fstrim.enable = true;

    # Create swapfile
    swapDevices = [
      {
        # To initialize a new swapfile on btrfs, you must first create it like so
        # truncate -s /swap/swapfile
        # chattr +C /swap/swapfile
        # btrfs property set /swap/swapfile compression none
        device = "/swap/swapfile";
        size = 4 * 1024;
      }
    ];

    # Encryption
    boot.initrd.luks.devices = {
      "nixos-root" = {
        device = "/dev/disk/by-uuid/b86056d1-d93f-4da3-813b-a86c80fea2b4";
      };
    };

    # Kernel
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader
    boot.loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      grub = {
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;
        useOSProber = true;
      };
    };

    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware.enableRedistributableFirmware = lib.mkDefault true;
  }
)
