{ config, pkgs, lib, ... }: {
  programs = {
    vscode = {
      enable = true;
      packages = vscode.override {
        commandLineArgs = "--enable-wayland-ime";
      }
    };
  };
}