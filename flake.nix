{
  description = "jhy's NixOS Flake";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-unstable 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # home-manager，用于管理用户配置
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # modern window compositor
    hyprland.url = "github:hyprwm/Hyprland";

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = { url = "github:nix-community/emacs-overlay"; };

    nixneovim = { url = "github:nixneovim/nixneovim"; };
    nixneovimplugins = { url = "github:jooooscha/nixpkgs-vim-extra-plugins"; };

    # community wayland nixpkgs
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    # color scheme - catppuccin
    catppuccin-btop = {
      url = "github:catppuccin/btop";
      flake = false;
    };
    catppuccin-fcitx5 = {
      url = "github:catppuccin/fcitx5";
      flake = false;
    };
    catppuccin-alacritty = {
      url = "github:catppuccin/alacritty";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
    catppuccin-hyprland = {
      url = "github:catppuccin/hyprland";
      flake = false;
    };
    catppuccin-emacs = {
      url = "github:catppuccin/emacs";
      flake = false;
    };
    catppuccin-vim = {
      url = "github:catppuccin/vim";
      flake = false;
    };
    catppuccin-grub = {
      url = "github:catppuccin/grub";
      flake = false;
    };
    catppuccin-mako = {
      url = "github:catppuccin/mako";
      flake = false;
    };
    catppuccin-waybar = {
      url = "github:catppuccin/waybar";
      flake = false;
    };
    catppuccin-rofi = {
      url = "github:catppuccin/rofi";
      flake = false;
    };
    catppuccin-qt5ct = {
      url = "github:catppuccin/qt5ct";
      flake = false;
    };

  };
  outputs = { self, nixpkgs, flake-utils, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      # 创建一个方便地使用 overlays 的函数
      overlays = [
        inputs.nixneovim.overlays.default
        inputs.nixneovimplugins.overlays.default
      ];
      pkgs = import nixpkgs {
        config.allowUnfree = true;
        inherit overlays system;
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs; };

          modules = [
            ./nixos/system.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = inputs;
                users = { jinhaoyuan = import ./home/home.nix; };
              };
            }
          ];
        };
      };
    };
}
