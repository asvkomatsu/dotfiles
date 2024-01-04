return {
	"RRethy/nvim-base16",
	config = function()
		require("base16-colorscheme").with_config({
			telescope = true,
		})
		-- vim.cmd('colorscheme base16-monokai')
		vim.cmd("colorscheme base16-ayu-dark")
	end,
}
--return {
--	"ofirgall/ofirkai.nvim",
--	config = function()
--		require("ofirkai").setup({
--			theme = nil,
--		})
--		vim.cmd("colorscheme ofirkai")
--	end,
--}
