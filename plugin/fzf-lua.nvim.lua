vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")

fzf.setup({
    -- 自动适配当前 Neovim 主题
    fzf_colors = true,

    -- 窗口外观
    winopts = {
        height = 0.85,
        width = 0.90,
        row = 0.50,
        col = 0.50,
        border = "rounded",
        preview = {
            layout = "flex",
            horizontal = "right:55%",
            vertical = "down:50%",
            scrollbar = "float",
        },
    },

    -- 搜索结果设置
    defaults = {
        file_icons = true,
        git_icons = true,
    },

    -- 文件搜索
    files = {
        prompt = "Files ❯ ",
        cwd_prompt = false,
        hidden = false,
        follow = false,
    },

    -- 全文搜索
    grep = {
        prompt = "Grep ❯ ",
        hidden = false,
        follow = false,
    },

    -- 忽略目录和文件
    file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        "target/",
        "build/",
        "%.lock$",
    },
})
local map = vim.keymap.set

-- 文件搜索
map("n", "<leader>ff", fzf.files, { desc = "Find Files" })

-- fzf-lua很强大，可以输入:FzfLua来选择想要的小工具，比如符号列表等
