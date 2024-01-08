local M = {
    'ofirgall/ofirkai.nvim',
    lazy = false,
    priority = 1000,
    branch = 'exp'
}

function M.config()
    require('ofirkai').setup {
        theme = 'dark_blue',
        scheme = require('ofirkai').scheme,
        custom_hlgroups = {},
        remove_italics = false,
    }
    vim.cmd.colorscheme 'ofirkai'
end

return M
