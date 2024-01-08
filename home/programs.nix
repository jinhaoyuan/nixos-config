{ config, pkgs, ... }: {
  programs = {
    home-manager = { enable = true; };
    git = {
      enable = true;
      userName = "jinhaoyuan";
      userEmail = "jinhaoyuan02@gmail.com";
    };
    vim = {
      extraConfig = ''
        	set number
        	set autoindent
        	set cindent
        	set tabstop=4
        	set softtabstop=4
        	set shiftwidth=4
          set expandtab
      '';
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
        plugins = [
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
    obs-studio = {
      enable = true;
      # plugins = with pkgs.obs-studio-plugins;
      #   [
      #     wlrobs
      #     # obs-backgroundremoval
      #     # obs-pipewire-audio-capture
      #   ];
    };
  };
  
  services = {
    mpd = {
      enable = true;
      # musicDirectory = "/home/jinhaoyuan/Music";
      musicDirectory = "~/Music";
      extraConfig = ''
        # Required files
        db_file            "~/.config/mpd/database"
        log_file           "~/.config/mpd/log"

        # Optional
        playlist_directory "~/.config/mpd/playlists"
        pid_file           "~/.config/mpd/pid"
        state_file         "~/.config/mpd/state"
        sticker_file       "~/.config/mpd/sticker.sql"
        audio_output {
          type "pulse"
          name "JHY PulseAudio" # this can be whatever you want
          server "127.0.0.1" # add this line - MPD must connect to the local sound serve
        }
      '';

      # Optional:
      network = {
        listenAddress =
          "any"; # if you want to allow non-localhost connections
        startWhenNeeded =
          true; # systemd feature: only start MPD service upon connection to its socket
      };
    };
    # flameshot = {
    #   enable = true;
    # };
  };


}
