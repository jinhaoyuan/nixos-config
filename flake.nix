{
  description = "jhy's NixOS Flake";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

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
      # 创建一个方便地使用 overlays 的函数
      overlays = [
        inputs.nixneovim.overlays.default
        inputs.nixneovimplugins.overlays.default
      ];
      # 构建一个带有 overlays 的 pkgs 实例
      pkgs = import nixpkgs { inherit overlays; };
    in flake-utils.lib.eachDefaultSystem (system: {
      nixosConfigurations = {
        "nixos" = pkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs pkgs; };
          modules = [
            ./nixos/system.nix
            home-manager.nixosModules.home-manager
            ({
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users = { jinhaoyuan = import ./home/home.nix; };
              };
            })
          ];
        };
      };
    });
  # outputs = { self, nixpkgs, flake-utils, home-manager, ... }@inputs: {
  #   nixpkgs.overlays = [
  #     inputs.nixneovim.overlays.default
  #     inputs.nixneovimplugins.overlays.default
  #   ];
  #   nixosConfigurations = {
  #     "nixos" = nixpkgs.lib.nixosSystem {
  #       system = "x86_64-linux";

  #       specialArgs = inputs; # 将 inputs 中的参数传入所有子模块
  #       modules = [
  #         ./nixos/system.nix
  #         home-manager.nixosModules.home-manager
  #         {
  #           home-manager = {
  #             useGlobalPkgs = true;
  #             useUserPackages = true;
  #             extraSpecialArgs = inputs;
  #             users = { jinhaoyuan = import ./home/home.nix; };
  #           };
  #         }
  #       ];
  #     };
  #   };
  # };
}
