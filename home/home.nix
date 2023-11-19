{ config, pkgs, ... }:

{
  imports = 
    [
      ./programs.nix
      ./hyprland
      ./alacritty
      # ./kitty
      # ./rofi
      ./waybar
      ./starship
    ];
  home = {
    username = "jinhaoyuan";
    homeDirectory = "/home/jinhaoyuan";
    stateVersion = "23.05";
  };
  home.packages = with pkgs;[
    #cli
    obs-studio
    alacritty
    # kitty
    joshuto
    cliphist
    wl-clipboard
    rofi-wayland
    eww-wayland
    hyprpaper
    waybar
    dunst
    tmux
    zellij
    udiskie
    rustdesk 
    emacs29 
    wlogout 
    swaybg 
    slurp 
    grim
    swaylock-effects
    mpv
    imv
    
    # music
    yesplaymusic
    # netease-cloud-music-gtk
    
    # communication
    telegram-desktop
    discord

    #zsh
    oh-my-zsh
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
    starship
   
    #backlight
    light 

    # archives
    zip
    xz
    unzip
    p7zip

    # networking tools
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    nmap # A utility for network discovery and security auditing

    # misc
    neofetch
    file
    which
    tree

    # productivity
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files
  ];
}
