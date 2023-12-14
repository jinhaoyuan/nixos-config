{config, pkgs, anyrun, ...}:
{
  imports = [
    anyrun.homeManagerModules.default
  ];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with anyrun.packages.${pkgs.system}; [
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        applications
        # randr
        rink
        shell
        symbols
        dictionary
        websearch
        translate
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.2; };
      width = { absolute = 800; };
      height = { absolute = 0; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss = ''
      @define-color bg-col  #24273a;
      @define-color bg-col-light #24273a;
      @define-color border-col #24273a;
      @define-color selected-col #24273a;
      @define-color blue #8aadf4;
      @define-color fg-col #cad3f5;
      @define-color fg-col2 #ed8796;
      @define-color grey #6e738d;

      * {
        transition: 200ms ease;
        font-family: "Fira Code Nerd Font";
        font-size: 1.3rem;
      }

      #window {
        background: transparent;
      }

      #plugin,
      #main {
        border: 3px solid @border-col;
        color: @fg-col;
        background-color: @bg-col;
      }
      /* anyrun's input window - Text */
      #entry {
        color: @fg-col;
        background-color: @bg-col;
      }

      /* anyrun's ouput matches entries - Base */
      #match {
        color: @fg-col;
        background: @bg-col;
      }

      /* anyrun's selected entry - Red */
      #match:selected {
        color: @fg-col2;
        background: @selected-col;
      }

      #match {
        padding: 3px;
        border-radius: 16px;
      }

      #entry, #plugin:hover {
        border-radius: 16px;
      }

      box#main {
        background: rgba(30, 30, 46, 0.7);
        border: 1px solid @border-col;
        border-radius: 15px;
        padding: 5px;
      }
    '';

    # extraConfigFiles."some-plugin.ron".text = ''
    #   Config(
    #     // for any other plugin
    #     // this file will be put in ~/.config/anyrun/some-plugin.ron
    #     // refer to docs of xdg.configFile for available options
    #   )
    # '';
  };
}