{ config, pkgs, lib, ... }: {
  imports = [
    ./nvim
    ./vscode
  ];
  home = {
    packages = with pkgs; [
      tree-sitter
      # ---lsp---
      nixd
      # rnix-lsp
      lua-language-server
      pyright
      rust-analyzer
      clang-tools
      nodePackages_latest.vscode-css-languageserver-bin
      nodePackages_latest.typescript
      nodePackages_latest.typescript-language-server
      nodePackages_latest.vscode-langservers-extracted
      nodePackages_latest.bash-language-server

      # ---format---
      nixpkgs-fmt
      stylua
      rustfmt
      black
      beautysh
      nodePackages.prettier

    ];
  };
}
