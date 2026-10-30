vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim" },
})

require("mini.files").setup({
    windows = {
        preview = true,
        width_focus = 35,
        width_nofocus = 15,
        width_preview = 35,
    },
    options = {
        permanent_delete = false,
    },
})

vim.keymap.set("n", "<Space>e", function()
    require("mini.files").open(
        vim.api.nvim_buf_get_name(0),
        false
    )
end, {
    desc = "Open floating file explorer",
})

require("mini.files").setup({
    mappings = {
        close = "q",

        -- 进入目录 / 打开文件
        go_in = "<CR>",
        go_in_plus = "<CR>",

        -- 返回上一级目录
        go_out = "<Left>",
        go_out_plus = "H",

        -- 其他操作
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",

    },

    windows = {
        preview = true,
        width_focus = 35,
        width_nofocus = 15,
        width_preview = 35,
    },

    options = {
        permanent_delete = false,
    },
})

