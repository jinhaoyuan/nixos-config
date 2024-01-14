return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufRead",
        config = function()
            local status_ok, ibl = pcall(require, "ibl")
            if not status_ok then
                return
            end
            local hook_status_ok, hooks = pcall(require, "ibl.hooks")
            if not hook_status_ok then
                return
            end
            local highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            }
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2" })
            end)

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
            ibl.setup({ scope = { highlight = highlight } })
        end,
    },
}
