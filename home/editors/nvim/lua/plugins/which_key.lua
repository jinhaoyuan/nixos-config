return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            plugins = {
                marks = true,     -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true,    -- adds help for operators like d, y, ...
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true,      -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true,            -- bindings for prefixed with g
                },
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            operators = { gc = "Comments" },
            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                -- For example:
                -- ["<space>"] = "SPC",
                -- ["<cr>"] = "RET",
                -- ["<tab>"] = "TAB",
            },
            motions = {
                count = true,
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>",   -- binding to scroll up inside the popup
            },
            window = {
                border = "none",          -- none, single, double, shadow
                position = "bottom",      -- bottom, top
                margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
                zindex = 1000,            -- positive value to position WhichKey above other floating windows.
            },
            layout = {
                height = { min = 4, max = 25 },                                               -- min and max height of the columns
                width = { min = 20, max = 50 },                                               -- min and max width of the columns
                spacing = 3,                                                                  -- spacing between columns
                align = "left",                                                               -- align columns left, center or right
            },
            ignore_missing = false,                                                           -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
            show_help = true,                                                                 -- show a help message in the command line for using WhichKey
            show_keys = true,                                                                 -- show the currently pressed key and its label as a message in the command line
            triggers = "auto",                                                                -- automatically setup triggers
            -- triggers = {"<leader>"} -- or specifiy a list manually
            -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
            trigger_nowait = {
                -- marks
                "`",
                "'",
                "g`",
                "g'",
                -- registers
                '"',
                "<c-r>",
                -- spelling
                "z=",
            },
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for keymaps that start with a native binding
                i = { "j", "k", "h", "l", "<leader>" },
                v = { "j", "k", "h", "l" },
                c = { "<leader>" },
            },
            -- disable the WhichKey popup for certain buf types and file types.
            -- Disabled by default for Telescope
            disable = {
                buftypes = {},
                filetypes = {},
            },
        },
        config = function()
            local te_status_ok, wk = pcall(require, "which-key")
            if not te_status_ok then
                return
            end
            wk.register({
                f = {
                    name = "+file",
                    f = { "<cmd>Telescope find_files<cr>", "Find File" },
                    l = { "<cmd>Telescope live_grep<cr>", "Search String" },
                    b = { "<cmd>Telescope buffers<cr>", "Open Buffers" },
                    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
                    o = { "<cmd>Telescope<cr>", "Option List" },
                },
                b = {
                    name = "+bufferline",
                    c = {
                        name = "close",
                        l = { "<cmd>BufferLineCloseLeft<CR>", "Close Left" },
                        r = { "<cmd>BufferLineCloseRight<CR>", "Close Right" },
                    }
                },
                w = {
                    name = "+window",
                    s = {
                        name = "+split",
                        v = { "<cmd>vsp<CR>", "Vertical Split" },
                        h = { "<cmd>sp<CR>", "Horizontal Split" },
                    },
                    c = {
                        name = "+close",
                        c = { "<C-w>c", "Close Current" },
                        o = { "<C-w>o", "Close Others" },
                    },
                },
                h = {
                    name = "+gitsigns",
                    s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
                    r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
                    S = { "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
                    u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
                    R = { "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
                    p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
                    b = { "<cmd>Gitsigns blame_line{full=true}<CR>", "Blame Line" },
                    t = {
                        name = "+toggle",
                        b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Blame" },
                        d = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle Deleted" },
                    },
                    d = { "<cmd>Gitsigns diffthis<CR>", "Diff This" },
                    D = { "<cmd>Gitsigns diffthis('~')<CR>", "Diff This ~" },
                }
            }, { prefix = "<leader>" })
            wk.register({
                h = {
                    s = { ":<C-U>Gitsigns stage_hunk<CR>", "Stage Hunk" },
                    r = { ":<C-U>Gitsigns reset_hunk<CR>", "Reset Hunk" },
                }
            }, { prefix = "<leader>", mode = "v" })
            wk.register({
                ih = { "<cmd>Gitsigns select_hunk<CR>", "Select Hunk" }
            }, { mode = { "o", "x" } })
        end,
    },
}
