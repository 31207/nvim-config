# Neovim 配置

个人 Neovim 配置，基于 Neovim 0.12+ 内置插件管理器 `vim.pack`，无需额外插件管理器。

## 环境要求

- Neovim >= 0.12（使用 `vim.pack` 与 `vim.lsp.config`）
- Nerd Font 字体（界面图标显示）
- 按需安装 LSP 服务端：
  - `clangd`（C / C++ / CUDA / Proto）
  - `rust-analyzer`（Rust）
  - `ty`（Python）

## 目录结构

```
.
├── init.lua               # 入口，加载 lua/ 下配置
├── lua/
│   ├── options.lua        # 编辑器选项
│   ├── keymaps.lua        # 通用快捷键
│   └── lsp.lua            # LSP 配置
├── plugin/                # 插件配置，启动时自动加载
│   ├── tokyonight.nvim.lua
│   ├── bufferline.nvim.lua
│   ├── blink.cmp.lua
│   ├── mini.nvim.lua
│   └── toggleterm.nvim.lua
└── nvim-pack-lock.json    # vim.pack 插件锁文件
```

## 插件

| 插件 | 用途 |
| --- | --- |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | 主题（night 风格） |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 顶部 Buffer 标签栏，显示 LSP 诊断 |
| [blink.cmp](https://github.com/saghen/blink.cmp) | 补全与签名帮助 |
| [mini.nvim](https://github.com/nvim-mini/mini.nvim) | `mini.files` 浮动文件浏览器 |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 浮动终端 |

插件首次启动时由 `vim.pack.add` 自动下载，版本记录在 `nvim-pack-lock.json`。

## LSP

在 `lua/lsp.lua` 中通过 `vim.lsp.config` + `vim.lsp.enable` 配置：

- `clangd`：根目录标记 `compile_commands.json`、`CMakeLists.txt`、`Makefile` 等
- `rust_analyzer`：启用全部 Cargo features 与 proc macro
- `ty`：搜索 `ty.toml`、`pyproject.toml`

## 快捷键

Leader 键为 `<Space>`。

### 通用

| 按键 | 功能 |
| --- | --- |
| `Ctrl+s` | 保存并回到 Normal 模式 |
| `Ctrl+Enter` | 在下方插入新行 |
| `Ctrl+Tab` | 下一个 Buffer |
| `Ctrl+q` | 关闭当前 Buffer |
| `Ctrl+h/j/k/l`（方向键） | 窗口间移动 |
| `Ctrl+Shift+方向键` | 调整窗口大小 |
| `<Space>e` | 打开 mini.files 文件浏览器 |

### 补全（blink.cmp）

| 按键 | 功能 |
| --- | --- |
| `Ctrl+Space` | 打开补全菜单 / 查看文档 |
| `Tab` / `Shift+Tab` | 选择下一个 / 上一个补全项 |
| `↑` / `↓` | 选择上一个 / 下一个补全项 |
| `Enter` | 确认补全 |
| `Ctrl+k` | 显示 / 隐藏函数签名 |
| `Ctrl+b` / `Ctrl+f` | 向上 / 向下滚动文档 |
| `Ctrl+e` | 关闭补全菜单 |

### 终端

| 按键 | 功能 |
| --- | --- |
| `Ctrl+/` | 开关浮动终端（85% 宽、80% 高） |

### 诊断与格式化

| 按键 | 功能 |
| --- | --- |
| `<Space>f` | 格式化当前缓冲区（LSP） |
| `<Space>d` | 显示当前行诊断详情 |
| `[d` / `]d` | 跳转到上一条 / 下一条诊断 |
| `<Space>dl` | 诊断列表写入 location list |

## 编辑器设置摘要

- 使用系统剪贴板（`unnamedplus`），启用鼠标
- Tab 宽度 4，空格替代 Tab
- 显示绝对行号 + 相对行号，高亮当前行
- 搜索忽略大小写、智能大小写、增量搜索
- 新分屏默认在右 / 下方打开

## 安装

```bash
git clone <repo-url> ~/.config/nvim
nvim
```

首次启动会自动安装插件；可用 `:packupdate` / `:packadd` 管理插件。
