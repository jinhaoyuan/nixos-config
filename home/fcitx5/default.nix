{
  pkgs,
  config,
  lib,
  catppuccin-fcitx5,
  ...
}: {
  home.file.".config/fcitx5/profile".source = ./profile;

  # color schema
  home.file.".local/share/fcitx5/themes".source = "${catppuccin-fcitx5}/src";
  home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;

  # every time fcitx5 switch input method, it will modify ~/.config/fcitx5/profile file,
  # which will override my config managed by home-manager
  # so we need to remove it before everytime we rebuild the config
  home.activation.removeExistingFcitx5Profile = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f "${config.xdg.configHome}/fcitx5/profile"
  '';

  
}
