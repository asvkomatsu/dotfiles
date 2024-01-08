local M = {
    'ggandor/lightspeed.nvim'
}

function M.config()
    require('lightspeed').setup({
        ignore_case = true,
    })
end

return M
