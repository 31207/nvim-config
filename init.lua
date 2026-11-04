require('keymaps')
require('options')
require('lsp')

-- 进入nvim时把工作目录设为提供的目录
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local arg = vim.fn.argv(0)

        if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
            vim.cmd.cd(vim.fn.fnameescape(arg))
        end
    end,
})
