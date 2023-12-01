{ config, pkgs, ... }:
{
  programs = {
    wezterm = {
      extraConfig = ''
        local wezterm = require 'wezterm';
        return = {
            font = wezterm.font 'Fira Code Nerd Font',
            color_scheme = 'Catppuccin Macchiato',
            launch_menu = {
                {
                  args = { 'btop' },
                },
                {
                  -- label = 'mpd',
                  args = { 'ncmpcpp' } 
                  -- cwd = "/some/path"
                  -- set_environment_variables = { FOO = "bar" },
                },
            },
        }
      '';
    };
  };
}
