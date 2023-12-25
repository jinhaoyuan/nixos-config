return {
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons'      -- optional
        },
        after = 'nvim-lspconfig',
        config = function()
            local status_ok, lg = pcall(require, "lspsaga")
            if not status_ok then
                vim.notify("lspsaga require failed", vim.log.levels.ERROR)
                return
            end
            local color_status_ok, catppuccin = pcall(require, "catppuccin.groups.integrations.lsp_saga")
            if not color_status_ok then
                vim.notify("lspsaga-catppuccin require failed", vim.log.levels.ERROR)
                return
            end
            lg.setup({
                ui = {
                    colors = catppuccin.custom_colors(),
                    kind = catppuccin.custom_kind(),
                    border = "single",
                },
                finder = {
                    default = 'def+ref+imp',
                },
            })

            local wk_status_ok, wk = pcall(require, "which-key")
            if not wk_status_ok then
                vim.notify("lspsaga-which_key require failed", vim.log.levels.ERROR)
                return
            end
            wk.register({
                gh = { "<cmd>Lspsaga finder<CR>", "LSP Finder" },
                ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
                gr = { "<cmd>Lspsaga rename<CR>", "Rename" },
                gD = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
                gd = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definition" },
                ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
                ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics" },
                ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Buffer Diagnostics" },
                ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic" },
                ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
                ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "Toggle Outline" },
                K = { "<cmd>Lspsaga hover_doc ++keep<CR>", "Hover Doc" },
                ["<Leader>ci"] = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
                ["<Leader>co"] = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
                ["<A-d>"] = { "<cmd>Lspsaga term_toggle<CR>", "Toggle Terminal" },
            }, { mode = "n" })

            -- 对于需要不同模式（普通和可视模式）的映射，可以单独设置
            wk.register({
                ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
            }, { mode = "v" })
        end,
    }
}
