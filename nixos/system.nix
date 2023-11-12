{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      ./network.nix
      ./user.nix
      ./boot.nix
      ./fonts.nix
      ./i18n.nix
      ./services.nix
    ];
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2f8923f1-abd3-4486-9e29-7ca817a4a351";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/2f8923f1-abd3-4486-9e29-7ca817a4a351";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/2f8923f1-abd3-4486-9e29-7ca817a4a351";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4EBF-AF03";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/e4410e55-fb0e-48fb-941b-d04d4d20c434"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # List packages installed in system profile. To search, run:
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment = {
    variables = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx";
    };	
    systemPackages = with pkgs; [
	git
	zsh
        vim 
        wget
	curl
        firefox
	v2ray
	v2raya
    ];
  };
  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "jinhaoyuan" ];      
      experimental-features = [ "nix-command" "flakes" ]; 
      substituters = [ 
        "https://mirrors.ustc.edu.cn/nix-channels/store" 
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "23.05";
}
