{ config, pkgs, ... }:
{
  programs = {
    wezterm = {
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = {}
        config.font = wezterm.font 'Fira Code Nerd Font'
        config.color_scheme = 'Catppuccin Macchiato'
        config.launch_menu = {
            {
              args = { 'btop' },
            },
            {
              -- label = 'mpd',
              args = { 'ncmpcpp' } 
              -- cwd = "/some/path"
              -- set_environment_variables = { FOO = "bar" },
            },
        }
        

        return config
      '';
    };
  };
}
