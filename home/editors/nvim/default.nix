{ config, pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];

  };

  
}
