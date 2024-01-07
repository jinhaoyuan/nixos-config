{ pkgs, config, catppuccin-qt5ct, ... }:
{
  home.file.".config/qt5ct/colors/Catppuccin-Macchiato.conf".source = "${catppuccin-qt5ct}/themes/Catppuccin-Macchiato.conf";
  qt = {
    enable = true;
    platformTheme = "qtct";
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" "flamingo" "green" "lavender" "maroon" "mauve" "peach" "pink" "red" "rosewater" "sapphire" "sky" "teal" "yellow" ];
        # accents = [ "pink" ];
        # size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
    };
  };
}
