{ config, pkgs, catppuccin-alacritty, ... }:
{
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
  # home.file.".config/alacritty/tokyonight_storm.yml".source = ./tokyonight_storm.yml;

  programs = {
    alacritty = {
      enable = true;
    };
  };

  xdg = {
    configFile = {
      "alacritty/theme_catppuccin.yml".source = "${catppuccin-alacritty}/catppuccin-macchiato.yml";
      "alacritty/alacritty.yml".text =
      ''
        import:
        # all alacritty themes can be found at
        #    https://github.com/alacritty/alacritty-theme
        - ~/.config/alacritty/theme_catppuccin.yml

        window:
          padding:
            x: 0
            y: 0
          # Background opacity
          #
          # Window opacity as a floating point number from `0.0` to `1.0`.
          # The value `0.0` is completely transparent and `1.0` is opaque.
          opacity: 1.0

          # Startup Mode (changes require restart)
          #
          # Values for `startup_mode`:
          #   - Windowed
          #   - Maximized
          #   - Fullscreen
          #
          # Values for `startup_mode` (macOS only):
          #   - SimpleFullscreen
          startup_mode: Maximized

          # Allow terminal applications to change Alacritty's window title.
          dynamic_title: true

          # Make `Option` key behave as `Alt` (macOS only):
          #   - OnlyLeft
          #   - OnlyRight
          #   - Both
          #   - None (default)
          option_as_alt: Both

        scrolling:
          # Maximum number of lines in the scrollback buffer.
          # Specifying '0' will disable scrolling.
          history: 10000

          # Scrolling distance multiplier.
          #multiplier: 3

        # Font configuration
        font:
          # Normal (roman) font face
          bold:
            family: Fira Code Nerd Font
          italic:
            family: Fira Code Nerd Font
          normal:
            family: Fira Code Nerd Font
          bold_italic:
            # Font family
            #
            # If the bold italic family is not specified, it will fall back to the
            # value specified for the normal font.
            family: Fira Code Nerd Font
      '';
    };
  };
 
}
