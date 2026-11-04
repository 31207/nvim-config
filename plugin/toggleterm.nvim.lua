vim.pack.add({
    {
        src = "https://github.com/akinsho/toggleterm.nvim",
        version = "v2.13.1",
    },
})

require("toggleterm").setup({
    size = 20,
    open_mapping = [[<C-/>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    autochdir = true,
    direction = "float",

    float_opts = {
        border = "rounded",
        width = function()
            return math.floor(vim.o.columns * 0.85)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 0,
    },
})
