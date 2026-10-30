vim.pack.add({
    { src = "https://github.com/akinsho/bufferline.nvim", version = "v4.9.1" },
})


require("bufferline").setup({
    options = {
        mode = "buffers",

        -- 标签栏样式
        style_preset = require("bufferline").style_preset.default,

        -- 显示关闭按钮
        show_buffer_close_icons = true,
        show_close_icon = false,

        -- 分隔符样式
        separator_style = "slant",

        -- 显示 LSP 诊断
        diagnostics = "nvim_lsp",

        -- 显示 Git 状态
        diagnostics_indicator = function(count, level)
            return "(" .. count .. ")"
        end,

        -- 不显示空 Buffer
        custom_filter = function(buf_number)
            return vim.bo[buf_number].buftype == ""
        end,

        -- 标签栏始终显示
        always_show_bufferline = true,

        -- 关闭 Buffer 时不自动关闭窗口
        close_command = function(buf)
            vim.cmd("bdelete! " .. buf)
        end,

        right_mouse_command = "bdelete! %d",
    },
})

-- 关闭当前 Buffer

vim.keymap.set("n", "<C-q>", "<cmd>bdelete<CR>", {
    desc = "Close current buffer",
})
