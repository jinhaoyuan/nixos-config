return {
    {
        "ahmedkhalf/project.nvim",
        config = function()
            local te_status_ok, ts = pcall(require, "telescope")
            if not te_status_ok then
                return
            end
            local pj_status_ok, pj = pcall(require, "project_nvim")
            if not pj_status_ok then
                return
            end
            pj.setup({
                patterns = {
                    ".git",
                    "_darcs",
                    ".hg",
                    ".bzr",
                    ".svn",
                    "Makefile",
                    "package.json",
                    "flake.nix",
                    "init.lua",
                },
            })
            ts.load_extension("projects")
        end,
    },
}
