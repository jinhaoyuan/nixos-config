{ config, pkgs, nixneovim, anyrun, ... }:

{
  imports = [
    nixneovim.nixosModules.default
    ./programs.nix
    ./hyprland
    ./other
    ./waybar
    ./fcitx5
    ./editors
  ];
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
    mako
    wlogout
    swaylock-effects

    # GUI
    vscode
    yesplaymusic
    telegram-desktop
    qq
    discord
    podman-desktop
    rustdesk
    spacedrive
    obsidian
    gnome.gnome-tweaks

    # tools
    gdb
    clang
    cmake
    playerctl
    mpv
    imv
    ncmpcpp
    mpc-cli
    toastify
    cliphist
    wl-clipboard
    swaybg
    slurp
    grim
    udiskie
    libqalculate
    cava
    ffmpeg

    # terminal
    alacritty
    zellij
    nodejs
    wmctrl
    xdotool
    aria
    fd
    ripgrep
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
    jq

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
