{ pkgs, ... }: {
  # $ nix search wget
  environment = {
    sessionVariables = {
      INPUT_METHOD = "fcitx";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      QT_QPA_PLATFORM="wayland";
    };
    variables = {
      INPUT_METHOD = "fcitx";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      QT_QPA_PLATFORM="wayland";
    };
    systemPackages = with pkgs; [
      git
      zsh
      vim
      curl
      firefox
      v2ray
      v2raya
      qemu
      virt-manager
      iproute2
      podman-compose
      # libgcc
      pkg-config
      gnome.gnome-themes-extra
    ];
  };
}
