vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim'
})


local mytheme = require'lualine.themes.material'
require('lualine').setup {
    options = {
        theme = mytheme
    }
}
