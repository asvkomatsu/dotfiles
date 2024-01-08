local M = {
    'RRethy/vim-illuminate',
}

function M.config()
    require('illuminate').configure {
        filetypes_denylist = {
            'mason',
            'harpoon',
            'DressingInput',
            'NeogitCommitMessage',
            'qf',
            'dirvish',
            'minifiles',
            'fugitive',
            'alpha',
            'NvimTree',
            'lazy',
            'NeogitStatus',
            'Trouble',
            'netwr',
            'lir',
            'DiffviewFiles',
            'Outline',
            'Jaq',
            'spectre_panel',
            'toggleterm',
            'DressingSelect',
            'TelescopePrompt',
        },
    }
end

return M
