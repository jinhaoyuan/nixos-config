{config, pkgs, ...}:
{
    let 
        homeDir = home.homeDirectory;
    in {
        services = {
            mpd = {
              enable = true;
              user = "jinhaoyuan";
              musicDirectory = "${homeDir}/Music";
              dbFile = "${homeDir}/database";

              extraConfig = ''
                log_file           "${homeDir}/.config/mpd/log"
                playlist_directory "${homeDir}/.config/mpd/playlists"
                pid_file           "${homeDir}/.config/mpd/pid"
                state_file         "${homeDir}/.config/mpd/state"
                sticker_file       "${homeDir}/.config/mpd/sticker.sql"
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
        }
    }
    
}