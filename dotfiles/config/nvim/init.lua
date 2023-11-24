--======================================================
-- PLUGINS
--======================================================

local lazy = {}

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

function lazy.install(path)
    if not vim.loop.fs_stat(path) then
        print('Installing lazy.nvim...')
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable',
            path,
        })
    end
end

function lazy.setup(plugins)
    if vim.g.plugins_ready then
        return
    end

    -- You can "comment out" the line below after lazy.nvim is installed
    lazy.install(lazy.path)

    vim.opt.rtp:prepend(lazy.path)

    require('lazy').setup(plugins, lazy.opts)
    vim.g.plugins_ready = true
end

-- define list of plugins
lazy.setup({
    { 'ofirgall/ofirkai.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'numToStr/Comment.nvim' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    { 'kyazdani42/nvim-tree.lua' },
    { 'nvim-telescope/telescope.nvim', tag='0.1.4', dependencies = 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'akinsho/toggleterm.nvim' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
    },
    { 'mfussenegger/nvim-jdtls' },
})

-- ofirkai configuration
require('ofirkai').setup {
    theme = nil,
    remove_italics = false,
}

-- lualine configuration
require('lualine').setup({
    options = {
        theme = require('ofirkai.statuslines.lualine').theme,
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
            statusline = { 'NvimTree' }
        }
    }
})

-- bufferline configuration
require('bufferline').setup {
    highlights = require('ofirkai.tablines.bufferline').highlights,
    options = {
        mode = 'buffers',
        offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } },
        separator_style = 'slant',
        show_buffer_icons = true,
        numbers = 'ordinal',
        max_name_length = 40,
    },
}

-- indent-blankline configuration
require('ibl').setup {
    indent = {
        char = '|',
    },
}

-- comment configuration
require('Comment').setup {
}

-- nvim-tree configuration
require('nvim-tree').setup {
    hijack_cursor = false,
    on_attach = function(bufnr)
        local bufmap = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
        end

        local api = require('nvim-tree.api')

        bufmap('L', api.node.open.edit, 'Expand folder or go to file')
        bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
        bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
}

-- telescope configuration
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}
-- require('telescope').load_extension('fzf')

-- toggleterm configuration
require('toggleterm').setup {
    open_mapping = '<C-g>',
    direction = 'horizontal',
    shade_terminals = true
}

--==========================
-- LSP Configs
--==========================

-- mason configuration
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()


local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp setup =======================================

-- Angular
lspconfig.angularls.setup {
    capabilities = lsp_capabilities,
}

-- NASM
lspconfig.asm_lsp.setup {
    capabilities = lsp_capabilities,
}

-- Bash
lspconfig.bashls.setup {
    capabilities = lsp_capabilities,
}

-- CSS
lspconfig.cssls.setup {
    capabilities = lsp_capabilities,
}

-- Docker compose
lspconfig.docker_compose_language_service.setup {
    capabilities = lsp_capabilities,
}

-- Dockerfile
lspconfig.dockerls.setup {
    capabilities = lsp_capabilities,
}

-- DOT (graphviz)
lspconfig.dotls.setup {
    capabilities = lsp_capabilities,
}

-- EMMET
lspconfig.emmet_language_server.setup {
    capabilities = lsp_capabilities,
}

-- HTML
lspconfig.html.setup {
    capabilities = lsp_capabilities,
}

-- HTMX
lspconfig.htmx.setup {
    capabilities = lsp_capabilities,
}

-- JSON
lspconfig.jsonls.setup {
    capabilities = lsp_capabilities,
}

-- Lua
lspconfig.lua_ls.setup {
    capabilities = lsp_capabilities,
}

-- Markdown
lspconfig.marksman.setup {
    capabilities = lsp_capabilities,
}

-- Python
lspconfig.pyright.setup {
    capabilities = lsp_capabilities,
}

-- SQL
lspconfig.sqlls.setup {
    capabilities = lsp_capabilities,
}

-- Tailwindcss
lspconfig.tailwindcss.setup {
    capabilities = lsp_capabilities,
}

-- Typescript
lspconfig.tsserver.setup {
    capabilities = lsp_capabilities,
}

-- YAML
lspconfig.yamlls.setup {
    capabilities = lsp_capabilities,
}

--=======================================

-- lsp actions
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Displays hover information about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- Jump to the definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- Jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- List all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jumps to the definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- Lists all the references
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- Displays a function's signature information
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- Renames all references to the symbol under the cursor
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- Selects a code action available at the current cursor position
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

        -- Show diagnostics in a floating window
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

        -- Move to the previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

        -- Move to the next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
})

require('luasnip.loaders.from_vscode').lazy_load()

-- configuration for nvim-cmp
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'}
    },
    mapping = {
        -- confirm selection
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- move between completion items
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        -- scroll text in the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- cancel completion
        ['<C-e>'] = cmp.mapping.abort(),

        -- jump to the next placeholder in the snippet
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        -- jump to the previous placeholder in the snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),

        -- autocomplete with tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        -- if the completion menu is visible, move to the previous item
        ['<C-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),

    },
})

-- change sign icons
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = '»'})

-- configure diagnostics
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
    },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
)

local jdtls_config = {
    cmd = {'/home/andre-komatsu/.local/share/nvim/mason/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(jdtls_config)

--======================================================
-- KEYBINDINGS
--======================================================
--
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- 	{mode} -> mode where the keybinding should execute
-- 		- n: normal mode
-- 		- i: insert mode
-- 		- x: visual mode
-- 		- s: selection mode
-- 		- v: visual + selection mode
-- 		- t: terminal mode
-- 		- o: operator-pending mode
-- 		- '': n+v+o modes
-- 	{lhs} -> the key we want to bind
-- 	{rhs} -> action we want to execute (string with command / expression / lua fn)
-- 	{opts} -> lua table with the following properties:
-- 		- desc: description string
-- 		- remap: bool that indicates if keybinding can be recursive
-- 		- buffer: true -> current file / number -> id of open buffer
-- 		- silent: whether or not the keybinding can show a message
-- 		- expr: if true, gives the chance to use vimscript / lua to calculate rhs

-- redefines the leader key
vim.g.mapleader = ' '

-- edit config file
vim.keymap.set({'n'}, '<leader>=', '<cmd>edit $MYVIMRC<cr>')

-- copy to system clipboard
vim.keymap.set({'n', 'x'}, '<leader>y', '"+y')

-- paste from system clipboard
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')

-- save contents
vim.keymap.set({'n'}, '<leader>w', '<cmd>write<cr>')

-- exit nvim
vim.keymap.set({'n'}, '<leader>q', '<cmd>quit<cr>')

-- select all text in current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

--=====================
-- Telescope shortcuts

    -- toggle nvim tree
    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
--=====================

--=====================
-- Telescope shortcuts

    -- search opened files
    vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
    -- search files in current directory
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    -- search recently opened files
    vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
    -- search pattern in all files in pwd
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
    -- search diagnostics messages (error / warning / hint)
    vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
    -- search pattern in current file
    vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
--=====================

--=====================
-- Mason shortcuts

    -- show mason window
    vim.keymap.set('n', '<leader>m', '<cmd>Mason<cr>')
--=====================

--======================================================
-- OPTIONS
--======================================================

-- preserve the indentation of a virtual line (wrap)
vim.opt.breakindent = true

-- convert tab to spaces
vim.opt.expandtab = true

-- highlight the results of the previous search
vim.opt.hlsearch = false

-- ignores uppercase letters when executing a search
vim.opt.ignorecase = true

-- enables mouse for every mode
vim.opt.mouse = 'a'

-- show line numbers
vim.opt.number = true

-- amount of characters used to indent a line
vim.opt.shiftwidth = 4

-- ignores uppercase letters when executing a search
-- unless the search term has an uppercase letter
vim.opt.smartcase = true

-- number of spaces of a tab
vim.opt.tabstop = 4

-- makes the text of long lines always visible
vim.opt.wrap = true

-- show cursorline
vim.opt.cursorline = true

-- dark background
vim.o.background = 'dark'

-- apply color scheme
vim.opt.termguicolors = true
vim.cmd('colorscheme ofirkai')

-- disable current mode (done on lualine)
vim.opt.showmode = false
