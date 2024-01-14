return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            local status_ok, gitsigns = pcall(require, "gitsigns")
            if not status_ok then
                return
            end
            gitsigns.setup({
                signs = {
                    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                    change = {
                        hl = "GitSignsChange",
                        text = "│",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "_",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "‾",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "~",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000,
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                yadm = {
                    enable = false,
                },
            })
            local wk_status_ok, wk = pcall(require, "which-key")
            if not wk_status_ok then
                return
            end
            wk.register({
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
                },
            }, { prefix = "<leader>" })
            wk.register({
                h = {
                    s = { ":<C-U>Gitsigns stage_hunk<CR>", "Stage Hunk" },
                    r = { ":<C-U>Gitsigns reset_hunk<CR>", "Reset Hunk" },
                },
            }, { prefix = "<leader>", mode = "v" })
            wk.register({
                ih = { "<cmd>Gitsigns select_hunk<CR>", "Select Hunk" },
            }, { mode = { "o", "x" } })
        end,
    },
}
