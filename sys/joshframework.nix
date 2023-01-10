# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, networkmanager-nixpkgs, modulesPath, lib, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  networking.hostName = "joshframework";

  nixpkgs.overlays = [
    (final: prev:
      let nmpkgs = networkmanager-nixpkgs.legacyPackages.x86_64-linux;
      in
      {
        inherit (nmpkgs) wpa_supplicant;
      })
  ];

  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    libimobiledevice
  ];

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
  };

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.blacklistedKernelModules = [ "hid_sensor_hub" ]; # fix brightness keys on 12th gen intel framework
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/" =
    {
      device = "/dev/mapper/root";
      fsType = "btrfs";
      options = [ "subvol=root" ];
      neededForBoot = true;
    };

  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-label/root";
    allowDiscards = true;
  };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    {
      device = "/dev/mapper/root";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/mapper/root";
      fsType = "btrfs";
      options = [ "subvol=swap" "compress=none" "noatime" ];
    };

  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8 * 1024;
    }
  ];

  boot.supportedFilesystems = [ "ntfs" ];

  services.fstrim.enable = true;
  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.fileSystems = [
    "/"
    "/nix"
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.timeout = 5;

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}

