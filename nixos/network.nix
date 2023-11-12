{ config, lib, pkgs, ... }:

{
  imports =
    [ 
    ];
  networking = {
      useDHCP = lib.mkDefault true;
      # interfaces.enp3s0.useDHCP = lib.mkDefault true;
      # interfaces.wlo1.useDHCP = lib.mkDefault true;
      hostName = "nixos";
      networkmanager.enable = true;
  };
}

