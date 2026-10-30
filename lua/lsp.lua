vim.lsp.config("clangd", {
    cmd = { "clangd" },

    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        ".git",
        "CMakeLists.txt",
        "Makefile",
    },
})

vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },

    filetypes = { "rust" },

    root_markers = {
        "Cargo.toml",
        "rust-project.json",
        ".git",
    },

    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },

            -- check = {
            --     command = "clippy",
            -- },

            procMacro = {
                enable = true,
            },
        },
    },
})

vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", ".git" },
})

vim.lsp.enable({
    "clangd",
    "ty",
    "rust_analyzer",
})




