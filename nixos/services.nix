{ config, lib, pkgs, ... }: {
  # Enable the X11 windowing system.
  services = {
    v2raya.enable = true;
    blueman.enable = true;
    openssh = { enable = true; };
    flatpak.enable = true;
    # upower.enable = true;

  };

  programs = {
    light.enable = true;
    # hyprland = {
    #   enable = true;

    #   xwayland = { enable = true; };

    #   # nvidiaPatches = true;
    # };
    ssh = {
      extraConfig = ''
        Host github.com
          Hostname ssh.github.com
          Port 443
          User git
      '';
    };
  };
  virtualisation = {
    libvirtd = { enable = true; };
    # docker = {
    #   enable = true;
    #   storageDriver = "btrfs";
    # };
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
