return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            local status_ok, tg = pcall(require, "toggleterm")
            if not status_ok then
                return
            end
            tg.setup({
                -- size can be a number or function which is passed the current terminal
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<C-t>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                shade_terminals = false,
                -- shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                start_in_insert = true,
                insert_mappings = false,   -- whether or not the open mapping applies in insert mode
                terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
                persist_size = true,
                direction = "horizontal", --'vertical' | 'horizontal' | 'window' | 'float',
                close_on_exit = true,     -- close the terminal window when the process exits
                shell = vim.o.shell,      -- change the default shell
                auto_scroll = true,       -- automatically scroll to the bottom on terminal output
                -- This field is only relevant if direction is set to 'float'
                float_opts = {
                    -- The border key is *almost* the same as 'nvim_open_win'
                    -- see :h nvim_open_win for details on borders however
                    -- the 'curved' border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    border = 'single', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                    -- like `size`, width and height can be a number or function which is passed the current terminal
                    -- width = 80,
                    -- height = 20,
                    -- winblend = 3,
                    -- zindex = <value>,
                },
                winbar = {
                    enabled = false,
                    name_formatter = function(term) --  term: Terminal
                        return term.name
                    end
                },
            })
        end
    }
}
