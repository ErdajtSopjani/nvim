return {
	{
		"projekt0n/github-nvim-theme",
		-- init = function()
		-- 	vim.cmd("set termguicolors")
		-- 	vim.cmd.colorscheme("github_dark_dimmed")
		-- 	vim.cmd([[highlight Cursor guifg=pine guibg=lightpink]])
		-- end,
	},

	{
		"folke/tokyonight.nvim",
		-- init = function()
		-- vim.cmd 'set termguicolors'
		-- vim.cmd.colorscheme 'tokyonight-moon'
		--
		-- vim.defer_fn(function()
		--   vim.cmd [[highlight Cursor guifg=#FFFFFF guibg=lightgreen]]
		-- end, 1)
		-- end,
	},

	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_terminal_colors = 1
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_better_performance = 1
			vim.g.everforest_cursor = "aqua"
			vim.cmd.colorscheme("everforest")
			-- can set warning/error text to colored: vim.g.everforest_diagnostic_virtual_text = 'colored'
		end,
	},

	{
		"catppuccin/nvim",
		-- config = function()
		--   -- vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightpink]]
		-- end,
		name = "catppucin",
	},
}
