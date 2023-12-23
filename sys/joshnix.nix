(
  {
    config,
    pkgs,
    lib,
    ...
  }: {
    boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-amd"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/6ec5fd90-a1b2-4557-9d1e-30388a041ddc";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/9F0A-908D";
      fsType = "vfat";
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/0796014c-35c7-493d-8e1d-17ad4b0a58a2";}
    ];

    # environment.variables = {
    #   CLUTTER_BACKEND = "wayland";
    #   GBM_BACKEND = "nvidia-drm";
    #   LIBVA_DRIVER_NAME = "nvidia";
    #   XDG_SESSION_TYPE = "wayland";
    #   MOZ_ENABLE_WAYLAND = "1";
    #   __GLX_VENDOR_LIBRARY = "nvidia";
    #   WLR_NO_HARDWARE_CURSORS = "1";
    #   WLR_BACKEND = "vulkan";
    #   QT_QPA_PLATFORM = "wayland";
    #   GDK_BACKEND = "wayland";
    # };

    boot.blacklistedKernelModules = ["nouveau"];

    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.powerManagement.enable = true;

    services.xserver.videoDrivers = [
      "nvidia"
    ];
    services.xserver.deviceSection = ''
      Option "AllowSHMPixmaps" "on"
      Option "DRI3" "on"
    '';

    virtualisation.docker.enableNvidia = true;
    virtualisation.podman.enableNvidia = true;

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
      DefaultTimeoutStopSec=10s
      DefaultTimeoutStartSec=10s
    '';

    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.editor = false;
    boot.loader.systemd-boot.configurationLimit = 10;
    boot.loader.timeout = 5;

    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    system.stateVersion = "23.05"; # Did you read the comment?
  }
)
