{ config, pkgs, ... }:
{
  programs = {
    nushell = { 
      enable = true;
      extraConfig = ''
        show_banner: false,
      '';
      extraEnv = ''

      '';
      shellAliases = {
        setproxy = "$env.ALL_PROXY = 'http:127.0.0.1:20170'";
        unsetproxy = "hide ALL_PROXY";
        vi = "hx";
        vim = "hx";
        nano = "hx";
    };
  };  
  carapace.enable = true;
  carapace.enableNushellIntegration = true;
  };
}
