return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            local status_ok, dashboard = pcall(require, "dashboard")
            if not status_ok then
                return
            end
            dashboard.setup({
                -- config
            })
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
