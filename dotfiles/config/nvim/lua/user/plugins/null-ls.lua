local M = {
    'nvimtools/none-ls.nvim'
}

function M.config()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting

    null_ls.setup {
        sources = {
            formatting.stylua,
            formatting.prettier,
            formatting.prettier.with {
                extra_filetypes = { 'toml' },
            },
            null_ls.builtins.completion.spell,
        },
    }
end

return M
