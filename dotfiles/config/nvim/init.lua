-- redefines the leader key
vim.g.mapleader = ' '
vim.g.mapllocaleader = ' '

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
    -- Detect tabstop and shiftwidth automatically
    { 'tpope/vim-sleuth' },

    -- commands to manipulate surrounding chars ([{'"
    { 'tpope/vim-surround' },

    -- enable reapeat command on plugin actions
    { 'tpope/vim-repeat' },

    -- LSP related plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- useful status updates for LSP
            { 'j-hui/fidget.nvim', opts={} },

            -- additional lua configuration
            'folke/neodev.nvim',
        },
    },

    -- autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- snippet engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',

            -- source for buffer words
            'hrsh7th/cmp-buffer',

            -- source for filesystem paths
            'hrsh7th/cmp-path',

            -- source for vim's cmdline
            'hrsh7th/cmp-cmdline',
        },
    },

    -- show pending keystrokes (keybindings help)
    { 'folke/which-key.nvim', opts={} },

    -- color scheme inspired on Monokai
    {
        'ofirgall/ofirkai.nvim',
        opts = {
            theme = nil,
            remove_italics = false,
        }
    },

    -- set lualine as statusline
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                --theme = require('ofirkai.statuslines.lualine').theme,
                icons_enabled = true,
                component_separators = '|',
                section_separators = '',
                disabled_filetypes = {
                    statusline = { 'NvimTree' }
                }
            }
        },
    },

    -- add indentation guides even on blank lines
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '|',
            },
        },
    },

    -- fuzzy finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            },
        },
    },

    -- highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- show open buffers as tabs on top of window
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            --highlights = require('ofirkai.tablines.bufferline').highlights,
            options = {
                mode = 'buffers',
                offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } },
                separator_style = 'slant',
                show_buffer_icons = true,
                numbers = 'ordinal',
                max_name_length = 40,
            },
        },
    },

    -- smarter comments
    { 'numToStr/Comment.nvim' },

    -- file explorer
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        opts = {
        },
    },

    -- integrates terminal into nvim window
    {
        'akinsho/toggleterm.nvim',
        opts = {
            open_mapping = '<C-g>',
            direction = 'horizontal',
            shade_terminals = true
        },
    },

    -- improved moviment inside the visible area of the editor
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
    },
})


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

-- easy esc
vim.keymap.set('i', 'jj', '<esc>')

-- edit config file
vim.keymap.set({'n'}, '<leader>=', '<cmd>edit ~/repos/dotfiles/dotfiles/config/nvim/init.lua<cr>')

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

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr=true, silent=true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr=true, silent=true })

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Split window
vim.keymap.set('n', '<leader>sh', '<cmd>split<cr>')
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>')

-- Navigate on windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

--=====================
-- Hop shortcuts

    local hop = require('hop')
    local directions = require('hop.hint').HintDirection

    vim.keymap.set('n', '<leader>s', '<cmd>HopWord<cr>', { desc = "hop start" })
--=====================

--=====================
-- Diagnostics shortcuts

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc='Go to previous diagnostic message' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc='Go to next diagnostic message' })
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc='Go to previous diagnostic message' })
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc='Go to previous diagnostic message' })
--=====================

--=====================
-- Neotree shortcuts

    -- toggle neotree
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle=true<cr>')
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

-- highlight the results of the previous search
vim.opt.hlsearch = false

-- ignores uppercase letters when executing a search
vim.opt.ignorecase = true

-- ignores uppercase letters when executing a search
-- unless the search term has an uppercase letter
vim.opt.smartcase = true

-- enables mouse for every mode
vim.opt.mouse = 'a'

-- show line numbers
vim.opt.number = true

-- preserve the indentation of a virtual line (wrap)
vim.opt.breakindent = true

-- convert tab to spaces
vim.opt.expandtab = true

-- amount of characters used to indent a line
vim.opt.shiftwidth = 4

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

-- save undo history
vim.o.undofile = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes' 

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- encoding options
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- backspace options
vim.opt.backspace = { "start", "eol", "indent" }

-- ignore folder for completion
vim.opt.wildignore:append({ "*/node_modules/*" })
