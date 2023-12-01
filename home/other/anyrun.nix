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
        randr
        rink
        shell
        symbols
        dictionary
        websearch
        kidex
        translate
      ];
      width = { fraction = 0.5; };
      position = "top";
      verticalOffset = { absolute = 0; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss = ''
      .some_class {
        background: red;
      }
    '';

    extraConfigFiles."some-plugin.ron".text = ''
      Config(
        // for any other plugin
        // this file will be put in ~/.config/anyrun/some-plugin.ron
        // refer to docs of xdg.configFile for available options
      )
    '';
  };
}