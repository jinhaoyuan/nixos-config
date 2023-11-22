{ catppuccin-rofi,  ... }:
{
  # home.file.".config/rofi/config.rasi".source = "${catppuccin-rofi}/themes/macchiato.css";
  home.file.".local/share/rofi/themes/catppuccin-macchiato.rasi".source = "${catppuccin-rofi}/themes/catppuccin-macchiato.rasi";
 
  programs = {
    rofi = {
      enable = true;
    };
  };
  xdg = {
    configFile = {
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
      
      @theme "catppuccin-mocha"
      '';
    };
  }
}
