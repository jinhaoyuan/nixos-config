return {
    {
        "nvim-tree/nvim-tree.lua",
        -- enabled = false,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        keys = {
            { "ee", ":NvimTreeToggle<cr>", desc = "NvimTree" },
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.opt.termguicolors = true
            local status_ok, nvim_tree = pcall(require, "nvim-tree")
            if not status_ok then
                return
            end
            nvim_tree.setup({ -- BEGIN_DEFAULT_OPTS
                sort_by = "case_sensitive",
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
                view = {
                    width = 25,
                    side = "left",
                },
            })
        end,
    },
}
