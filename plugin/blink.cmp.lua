
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = "v1", name = "blink.cmp" },
})

require("blink.cmp").setup({
    -- 'default'（推荐）：使用类似 Neovim 内置补全的按键映射（使用 C-y 确认补全）
    -- 'super-tab'：使用类似 VSCode 的按键映射（使用 Tab 确认补全）
    -- 'enter'：使用 Enter 确认补全
    -- 'none'：不启用任何默认按键映射
    --
    -- 所有预设都包含以下按键映射：
    -- C-space：打开补全菜单；如果菜单已经打开，则打开文档说明
    -- C-n/C-p 或 Up/Down：选择下一个/上一个补全项
    -- C-e：关闭补全菜单
    -- C-k：切换签名帮助（需要 signature.enabled = true）
    --
    -- 自定义按键映射的详细说明：
    -- :h blink-cmp-config-keymap
    keymap = {
        -- 每个按键映射都可以是由多个命令和/或函数组成的列表
        preset = "enter",

        -- 选择补全项
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        -- 滚动文档说明
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        -- 显示/隐藏函数签名帮助
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },

    appearance = {
        -- 'mono'（默认）：适用于 Nerd Font Mono 字体
        -- 'normal'：适用于普通 Nerd Font 字体
        -- 调整图标间距，使图标能够对齐
        nerd_font_variant = "mono",
    },

    -- 默认启用的补全来源
    -- 你可以在其他配置文件中通过 opts_extend 扩展这些来源，而不必重新定义整个配置
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    -- 默认使用 Rust 实现的模糊匹配器，具有较强的拼写容错能力和更高的运行性能
    -- 如果无法使用 Rust 匹配器，可以通过以下方式使用 Lua 实现：
    -- implementation = "lua"：使用 Lua 实现
    -- implementation = "prefer_rust"：优先使用 Rust，不可用时回退到 Lua
    --
    -- 更多模糊匹配相关说明请参考官方文档
    fuzzy = { implementation = "lua" },

    completion = {
        -- 仅匹配光标前面的文本
        keyword = { range = "prefix" },

        menu = {
            -- 补全菜单
            draw = {
                -- 使用 Treesitter 对指定补全来源的标签文本进行语法高亮
                treesitter = { "lsp" },
            },
        },

        -- 当输入触发字符时自动显示补全菜单
        -- 触发字符由各个补全来源定义
        trigger = { show_on_trigger_character = true },

        documentation = {
            -- 自动显示补全文档说明
            auto_show = true,
        },
    },

    -- 输入函数参数时显示签名帮助
    signature = { enabled = true },
})

