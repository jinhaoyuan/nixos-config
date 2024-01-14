return {
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",     -- optional
        },
        after = "nvim-lspconfig",
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
                    default = "def+ref+imp",
                },
                lightbulb = {
                    sign = false,
                },
            })

            local wk_status_ok, wk = pcall(require, "which-key")
            if not wk_status_ok then
                vim.notify("lspsaga-which_key require failed", vim.log.levels.ERROR)
                return
            end
            wk.register({
                l = {
                    name = "+LSP",
                    f = { "<cmd>Lspsaga finder<CR>", "LSP Finder" },
                    a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
                    r = { "<cmd>Lspsaga rename<CR>", "Rename" },
                    pd = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
                    gd = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definition" },
                    o = { "<cmd>Lspsaga outline<CR>", "Toggle Outline" },
                    c = {
                        name = "+calls",
                        i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
                        o = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
                    },

                    k = { "<cmd>Lspsaga hover_doc ++keep<CR>", "Hover Doc" },
                },
                d = {
                    name = "+diagnostic",
                    l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
                    c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics" },
                    b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Buffer Diagnostics" },
                    p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic" },
                    n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
                },
                tf = { "<cmd>Lspsaga term_toggle<CR>", "Toggle Terminal" },
            }, { prefix = "<leader>", mode = "n" })

            -- 对于需要不同模式（普通和可视模式）的映射，可以单独设置
            wk.register({
                la = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
            }, { prefix = "<leader>", mode = "n" })
        end,
    },
}
