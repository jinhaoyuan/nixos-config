{ config, lib, pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      # xdg-desktop-portal-hyprland
      # xdg-desktop-portal-gtk
    ];
  };
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      displayManager = {
        # defaultSession = "hyprland";
        defaultSession = "gnome";
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      desktopManager = {
        gnome.enable = true;
        xterm.enable = false;
      };
    };
    gnome = {
      gnome-browser-connector.enable = true;
      gnome-online-accounts.enable = true;
      gnome-settings-daemon.enable = true;
    };
  };
}
