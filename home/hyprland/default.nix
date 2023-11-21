{ config, pkgs, catppuccin-hyprland, ... }:
{
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/macchiato.conf".source = "${catppuccin-hyprland}/themes/macchiato.conf";
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  home.file.".config/hypr/wallpapers" = {
    source = ../wallpapers;
    recursive = true;   # 递归整个文件夹
  };
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';
 
}
