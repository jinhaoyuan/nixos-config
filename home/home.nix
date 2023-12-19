{ config, pkgs, ... }:

{
  imports = [ ./programs.nix ./hyprland ./other ./waybar ./fcitx5 ./neovim];
  home = {
    username = "jinhaoyuan";
    homeDirectory = "/home/jinhaoyuan";
    stateVersion = "23.05";
  };
  home.packages = with pkgs; [
    # desktop
    eww-wayland
    hyprpaper
    waybar
    # dunst 
    mako
    wlogout
    swaylock-effects
    # rofi-wayland

    # GUI
    # obs-studio
    vscode
    yesplaymusic
    telegram-desktop
    discord
    podman-desktop

    # tools
    gdb
    clang
    cmake
    clang-tools
    playerctl
    mpv
    imv
    ncmpcpp
    toastify
    cliphist
    wl-clipboard
    swaybg
    slurp
    grim
    nixfmt
    udiskie
    libqalculate
    cava

    # terminal
    alacritty
    wezterm
    tmux
    zellij

    #emacs
    # emacs
    nodejs
    wmctrl
    xdotool
    # eaf-browser
    aria
    # eaf-file-manager
    fd

    # terminal-tools
    joshuto

    # shell
    oh-my-zsh
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
    starship

    # backlight
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
    btop # replacement of htop/nmon
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
