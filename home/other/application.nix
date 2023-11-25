{pkgs, config, catppuccin-qt5ct, ...}:
{
  home.file.".config/qt5ct/colors/Catppuccin-Macchiato.conf".source = "${catppuccin-qt5ct}/themes/Catppuccin-Macchiato.conf";
  qt = {
    enable = true;
    platformTheme = "qtct";
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
    };
  };
}