{ config, pkgs, ... }:
{
  programs = {
    nushell = { 
      enable = true;
      extraConfig = ''
        let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
        }
        $env.config = {
          show_banner: false,
        }
      '';
      extraEnv = ''

      '';
      shellAliases = {
        vi = "hx";
        vim = "hx";
        nano = "hx";
    };
  };  
  carapace.enable = true;
  carapace.enableNushellIntegration = true;
  };
}
