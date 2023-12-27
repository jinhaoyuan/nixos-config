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

      # ---format---
      # nixfmt
      nixpkgs-fmt
      stylua
      rustfmt
      black

    ];
  };
}
