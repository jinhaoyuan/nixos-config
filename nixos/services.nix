{ config, lib, pkgs, ... }:
{
  imports = 
    [
    ];
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-wlr
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      displayManager = {
	defaultSession = "hyprland";
	gdm = {
	  enable = true;
	  wayland = true;
	};
      };
      desktopManager = {
        gnome.enable = false;
        xterm.enable = false;
      };
    };
    v2raya.enable = true;
    openssh = {
      enable = true;
    };
  };

  programs = {
    light.enable = true;
    hyprland = {
      enable = true;
    
      xwayland = {
        enable = true;
      };
    
      nvidiaPatches = true;
    };
  }; 
}
