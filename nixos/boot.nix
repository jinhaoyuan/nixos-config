
{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ 
    ];
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';
    loader = {
       grub = {
           enable = true;
           device = "nodev";
           efiSupport = true;
           configurationLimit = 10;
           extraEntries = ''
               menuentry "Windows" {
                   search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                   chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
               }
           '';
       };
       efi = {
           canTouchEfiVariables = true;
           efiSysMountPoint = "/boot";
       };
    };
  };
}
