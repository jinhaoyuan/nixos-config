{ config, pkgs, ... }:
{
  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "jinhaoyuan";
      userEmail = "jinhaoyuan02@gmail.com";
    };
    waybar = {
      enable = true;
    };
    alacritty = {
      enable = true;
    };
    # kitty = {
    #   enable = true;
    # };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting = {
	enable = true;
	# styles = {};
      };
      oh-my-zsh = {
	enable = true;
	# theme = "half-life";
	plugins = 
	  [
	    "git"
	    "autojump"
	    # "thefuck"
	    "sudo"
	  ];
      };
      shellAliases = {
	"setproxy" = "export ALL_PROXY=http://127.0.0.1:20172";
	"unsetproxy" = "unset ALL_PROXY";
      };
    };
  };

}
