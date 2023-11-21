
{ config, lib, pkgs, ... }:
{
  imports =
    [ 
    ];
  security.sudo.wheelNeedsPassword = false;
  users = {
    # mutableUsers = false;
    users = {
      jinhaoyuan = {
        isNormalUser = true;
        extraGroups = [ 
	        "wheel"
          "networkmanager"
          "video"
          "audio"
          "docker"
          "libvirt"
          "libvirt-kvm"
	]; 
        shell = pkgs.zsh;
	      ignoreShellProgramCheck = true;
        description = "jinhaoyuan home";
        home = "/home/jinhaoyuan";
      };
    };
  };

}
