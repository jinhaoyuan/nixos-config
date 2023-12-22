{ config, pkgs, lib, ... }: 
{ 
  programs.nixneovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorscheme = "catppuccin-macchiato";

    plugins = {
      nvim-cmp = {
        enable = true;
        sources = {
          buffer.enable = true;
          nvim_lsp.enable = true;
          zsh.enable = true;
          cmp-cmdline-history.enable = true;
          luasnip.enable = true;
        };
        snippet.luasnip.enable = true;
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            modes = [ "i" "s" ];
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
          };
        };
      };

      lspconfig = {
        servers = {
          bashls.enable = true;
          rnix-lsp.enable = true;
          hls.enable = true;
          rust-analyzer.enable = true;
          pyright.enable = true;
          clangd.enable = true;
          lua-language-server.enable = true;
        };
      };
      treesitter = {
        enable = true;
        indent = true;
      };
    };

    extraPlugins = [ pkgs.vimExtraPlugins.catppuccin ];

    mappings = {
      normal = {
        "<C-h>" = "'<C-w>h'";
        "<C-j>" = "'<C-w>j'";
        "<C-k>" = "'<C-w>k'";
        "<C-l>" = "'<C-w>l'";
        "<C-Up>" = "':resize -2<CR>'";
        "<C-Down>" = "':resize +2<CR>'";
        "<C-Left>" = "':vertical resize +2<CR>'";
        "<C-Right>" = "':vertical resize -2<CR>'";
      };
    };
    extraConfigLua = ''
      -- Hint: use `:h <option>` to figure out the meaning if needed
      vim.opt.clipboard = 'unnamedplus' -- use system clipboard
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
      vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

      -- Tab
      vim.opt.tabstop = 4 -- number of visual spaces per TAB
      vim.opt.softtabstop = 4 -- number of spacesin tab when editing
      vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
      vim.opt.expandtab = true -- tabs are spaces, mainly because of python

      -- UI config
      vim.opt.number = true -- show absolute number
      vim.opt.relativenumber = true -- add numbers to each line on the left side
      vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
      vim.opt.splitbelow = true -- open new vertical split bottom
      vim.opt.splitright = true -- open new horizontal splits right
      vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
      vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

      -- Searching
      -- vim.opt.incsearch = true -- search as characters are entered
      vim.opt.hlsearch = false -- do not highlight matches
      vim.opt.ignorecase = true -- ignore case in searches by default
      vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

    '';
  };

}
