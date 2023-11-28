{ config, lib, pkgs, ... }:
{
    # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/home/jinhaoyuan/Music";
      user = "jinhaoyuan";
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
      network.listenAddress = "any"; # if you want to allow non-localhost connections
      startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
    };
  };

}