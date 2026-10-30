-- define common options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-A-Left>', '<C-w>h', opts)
vim.keymap.set('n', '<C-A-Down>', '<C-w>j', opts)
vim.keymap.set('n', '<C-A-Up>', '<C-w>k', opts)
vim.keymap.set('n', '<C-A-Right>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Right>', ':vertical resize +2<CR>', opts)

-- buffer
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


-- Save
vim.keymap.set({ "n", "i", "v" }, "<C-s>", function()
    vim.cmd("write")
    vim.cmd("stopinsert")
end, {
    desc = "Save and return to Normal mode",
})

-- insert new line(more convenient)
vim.keymap.set("n", "<C-CR>", "o<Esc>", {
    desc = "Insert line below",
})
vim.keymap.set("i", "<C-CR>", "<Esc>o<Esc>", {
    desc = "Insert line below",
})


---------------
--Lsp Setting--
---------------

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true, buffer = args.buf }
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
    end
})

vim.keymap.set("n", "<Space>d", vim.diagnostic.open_float, {
    desc = "Show diagnostic details",
})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic",
})

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic",
})
vim.keymap.set("n", "<Space>dl", vim.diagnostic.setloclist, {
    desc = "Diagnostic location list",
})

