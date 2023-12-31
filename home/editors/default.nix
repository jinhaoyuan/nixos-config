{ config, pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];

  };

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
      # nixfmt
      nixpkgs-fmt
      stylua
      rustfmt
      black
      beautysh
      nodePackages.prettier

    ];
  };
}
