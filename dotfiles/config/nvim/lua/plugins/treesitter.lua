return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "bash",
                "c", "css",
                "dockerfile",
                "glsl",
                "html",
                "java", "javascript", "json",
                "lua",
                "make", "markdown_inline",
                "python",
                "sql",
                "typescript",
                "xml",
                "yaml",
            },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
