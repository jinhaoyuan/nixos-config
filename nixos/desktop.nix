{ config, lib, pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-wlr
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
  environment.gnome.excludePackages = (with pkgs; [
    # gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    # cheese # webcam tool
    # gnome-music
    # gedit # text editor
    epiphany # web browser
    # geary # email reader
    # evince # document viewer
    # gnome-characters
    # totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
  qt = {
    enable = true;
    # platformTheme = "gnome";
    style = "kvantum";
  };
}
