return {
    {
        "akinsho/bufferline.nvim",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        config = function()
            local status_ok, bufferline = pcall(require, "bufferline")
            if not status_ok then
                return
            end
            local bufferline_highlights = require("catppuccin.groups.integrations.bufferline").get()
            bufferline.setup({
                highlights = bufferline_highlights,
                options = {
                    mode = "buffers", -- set to "tabs" to only show tabpages instead
                    numbers = "buffer_id",
                    --number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
                    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                    indicator = {
                        icon = "▎", -- this should be omitted if indicator style is not 'icon'
                        style = "icon",
                    },
                    buffer_close_icon = "x",
                    modified_icon = "●",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 30,
                    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                    -- tab_size = 21,
                    diagnostics = true,
                    diagnostics_update_in_insert = false,
                    offsets = {
                        {
                            -- filetype = "neo-tree",
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "center",
                            separator = false,
                        },
                    },
                    show_buffer_icons = true, -- disable filetype icons for buffers
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                    -- can also be a table containing 2 custom separators
                    -- [focused and unfocused]. eg: { '|', '|' }
                    separator_style = { "", "" }, --"slant" | "thick" | "thin" | { 'any', 'any' },
                    enforce_regular_tabs = true,
                    always_show_bufferline = false,
                },
            })
            vim.keymap.set("n", "<A-]>", ":BufferLineCycleNext<CR>")
            vim.keymap.set("n", "<A-[>", ":BufferLineCyclePrev<CR>")
            -- vim.api.nvim_del_keymap("n", "<Esc>")
            local wk_status_ok, wk = pcall(require, "which-key")
            if not wk_status_ok then
                return
            end
            wk.register({
                b = {
                    name = "+bufferline",
                    c = {
                        name = "close",
                        c = { ":bdelete<CR>", "Close Buffer" },
                        l = { "<cmd>BufferLineCloseLeft<CR>", "Close Left" },
                        r = { "<cmd>BufferLineCloseRight<CR>", "Close Right" },
                    },
                },
            }, { prefix = "<leader>" })
        end,
    },
}
