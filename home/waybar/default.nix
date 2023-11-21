{ config, pkgs, catppuccin-waybar, ... }:
{
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  home.file.".config/waybar/config".source = ./config;
  home.file.".config/waybar/style.css".source = ./style.css;
  home.file.".config/waybar/color.css".source = ./color.css;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  programs = {
    waybar = {
      enable = true;
    };
  };

 
}
