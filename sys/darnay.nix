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
    device = "/dev/disk/by-uuid/bd757871-5d79-4aa6-b846-d164292a077a";
    fsType = "ext4";
  };

  swapDevices = [];

  environment.variables = {
    QTWEBENGINE_CHROMIUM_FLAGS = "--disable-gpu";
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
  };

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

  networking.hostName = "darnay";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
    ];
  };

  aaaaaaaaa = 2;

  hardware.nvidia.open = false;

  systemd.enableEmergencyMode = false;

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
    DefaultTimeoutStartSec=10s
  '';

  security.sudo.extraConfig = ''
    # rollback results in sudo lectures after each reboot
    Defaults lecture = never
  '';

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "24.11"; # Did you read the comment?
}
