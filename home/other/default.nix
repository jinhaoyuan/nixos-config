{ ... }:

{
  imports =
    [
      #---------common-------
      ./btop.nix
      ./starship.nix
      ./application.nix
      

      #-------hyprland-------
      # ./rofi.nix
      # ./mako.nix
      # ./alacritty.nix
      # ./nushell.nix
      # ./wezterm.nix
      # ./anyrun.nix
      # ./ags.nix

      #--------gnome---------
      ./firefox.nix
      # ./desktop.nix

    ];
}
