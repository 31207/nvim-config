vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
})

require("tokyonight").setup({
    style = "night",

    transparent = false,
    terminal_colors = true,

    styles = {
        -- comments = { italic = true },
        -- keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },

    dim_inactive = false,
    lualine_bold = true,

    plugins = {
        all = true,
    },
})

vim.cmd.colorscheme("tokyonight")
