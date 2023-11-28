{ config, pkgs, catppuccin-starship, ... }:
{
  programs = {
    nushell = { 
      enable = true;
        
      shellAliases = {
        vi = "hx";
        vim = "hx";
        nano = "hx";
    };
  };  
  carapace.enable = true;
  carapace.enableNushellIntegration = true;
}