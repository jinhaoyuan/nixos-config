{ pkgs, catppuccin-rofi,  ... }:
{

  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi.override {
        package = pkgs.rofi-wayland;
        plugins = with pkgs;[ 
          rofi-emoji
          rofi-top
          rofi-calc
          rofi-file-browser
        ];
      }; 
    };
  };
  
  xdg = {
    configFile = {
      "rofi/catppuccin-macchiato.rasi".source = "${catppuccin-rofi}/basic/.local/share/rofi/themes/catppuccin-macchiato.rasi";
      "rofi/config.rasi".text =
      ''
      configuration{
          modi: "run,drun,window";
          icon-theme: "Oranchelo";
          show-icons: true;
          terminal: "alacritty";
          drun-display-format: "{icon} {name}";
          location: 0;
          disable-history: false;
          hide-scrollbar: true;
          display-drun: "   Apps ";
          display-run: "   Run ";
          display-window: " 󰖳  Window";
          display-Network: " 󰤨  Network";
          sidebar-mode: true;
      }
      
      @theme "catppuccin-macchiato"
      '';
    };
  };
}
