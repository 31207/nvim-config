-- 先导入主题
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim"},
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})

-- 配置主题(可选)
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


-- 最后决定启用哪个
-- 当然也可以用colorscheme命令切换
vim.cmd.colorscheme("catppuccin-mocha")
