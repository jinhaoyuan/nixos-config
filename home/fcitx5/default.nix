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

  i18n = {
    # defaultLocale = "zh_CN.UTF-8";
    # supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
	    addons  = with pkgs; [ 
	      fcitx5-rime 
	      fcitx5-chinese-addons 
          fcitx5-gtk
	    ];
      };
    };    
  };
}
