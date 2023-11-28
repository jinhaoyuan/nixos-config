{ config, pkgs, catppuccin-starship, ... }:
{
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/starship.toml".source = ./starship.toml;

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      settings = {
        add_newline = true;
        # Other config here
        format = ''
          $os$directory$git_branch$git_status$nodejs$rust$golang$php$lua$python$rust$docker_context$package
          $character'';
        right_format = "$time";
        continuation_prompt = "[ ▶▶ ](bold purple)";
        character = {
          success_symbol = "[ ➜](bold purple)";
        };
	directory = {
	  read_only = " 󰌾";
	  home_symbol = " 󰻺 ";
	};
	os = {
	  format = "[$symbol]($style)";
	  style = "bold blue";
	  disabled = false;
	};
	time = {
	  disabled = false;
	  format = "[ 󱑂 $time ]($style)";
	};
        palette = "catppuccin_macchiato";
      } // builtins.fromTOML (builtins.readFile "${catppuccin-starship}/palettes/macchiato.toml");
    };
  };
}
