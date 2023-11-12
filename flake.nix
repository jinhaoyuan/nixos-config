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
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };  

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-unstable 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager，用于管理用户配置
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # modern window compositor
    hyprland.url = "github:hyprwm/Hyprland";
    # community wayland nixpkgs
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # specialArgs = inputs;  # 将 inputs 中的参数传入所有子模块
        modules = [
          ./nixos/system.nix
	  home-manager.nixosModules.home-manager
          {
            home-manager = {
	      useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users = {
		jinhaoyuan = import ./home/home.nix;
	      };
	    };
          }
        ];
      };
    };
  };
}
