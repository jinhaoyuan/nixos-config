{ pkgs, ... }: {
  # $ nix search wget
  environment = {
    variables = {
      INPUT_METHOD="fcitx";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
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
      libgcc
      pkg-config
    ];
  };
}
