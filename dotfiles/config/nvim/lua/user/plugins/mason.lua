local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "nvim-lua/plenary.nvim",
    },
}

M.servers = {
    'angularls',
    'asm_lsp',
    'bashls',
    'clangd',
    'cssls',
    'dockerls',
    'emmet_ls',
    'html',
    'htmx',
    'jsonls',
    'jdtls',
    'tsserver',
    'ltex',
    'lua_ls',
    'marksman',
    'pyright',
    'sqlls',
    'tailwindcss',
    'lemminx',
    'yamlls',
}

function M.config()
    require('mason').setup {
        ui = {
            border = 'rounded',
        },
    }
    require('mason-lspconfig').setup {
        ensure_installed = M.servers,
    }
end

return M
