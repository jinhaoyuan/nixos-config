{ pkgs, catppuccin-rofi,  ... }:
{
  home.packages = with pkgs;[
    rofi-bluetooth
    rofi-vpn
    rofi-mpd
  ];
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      plugins = with pkgs;[ 
        rofi-emoji
        rofi-calc
        rofi-power-menu
      ];
      pass = {
        enable = true;
        package = pkgs.rofi-pass-wayland;
      };
      
    };
  };
  
  xdg = {
    configFile = {
      "rofi/catppuccin-macchiato.rasi".source = "${catppuccin-rofi}/basic/.local/share/rofi/themes/catppuccin-macchiato.rasi";
      "rofi/config.rasi".text =
      ''
      configuration{
          modes: [run,drun,window,ssh,calc,emoji];
          icon-theme: "Oranchelo";
          show-icons: true;
          terminal: "alacritty";
          drun-display-format: "{icon} {name}";
          location: 0;
          disable-history: false;
          hide-scrollbar: true;
          display-drun: "   ";
          display-run: "   ";
          display-window: " 󰖳  ";
          display-Network: " 󰤨  ";
          display-ssh: " 󰣀  ";
          display-calc: " 󰪚  ";
          display-emoji: " 󰞅  ";
          sidebar-mode: true;
      }
      
      @theme "catppuccin-macchiato"
      '';
    };
  };
}
