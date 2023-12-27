{ config, pkgs, ... }: {
  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = { theme = "catppuccin-macchiato"; };
    };
  };
}
