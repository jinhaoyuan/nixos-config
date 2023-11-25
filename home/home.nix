{ config, pkgs, ... }:

{
  imports = 
    [
      ./programs.nix
      ./hyprland
      ./other
      ./other
      ./waybar
      ./fcitx5
    ];
  home = {
    username = "jinhaoyuan";
    homeDirectory = "/home/jinhaoyuan";
    stateVersion = "23.05";
  };
  home.packages = with pkgs;[
    #cli
    alacritty
    joshuto
    cliphist
    wl-clipboard
    eww-wayland
    hyprpaper
    waybar
    dunst
    tmux
    zellij
    udiskie
    emacs29 
    wlogout 
    swaybg 
    slurp 
    grim
    swaylock-effects
    mpv
    imv
    toastify
    rofi-wayland
    podman-desktop

    # application
    obs-studio
    # rustdesk 
    # vmware-workstation
    vscode
    
    
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
    fzf
    navi

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files
    lshw
  ];
}
