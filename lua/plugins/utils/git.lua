return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = false, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%r",
			message_when_not_committed = "Uncommitted changes",
			delay = 0,
			highlight_group = "Question",
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},

		config = function()
			vim.keymap.set("n", "mgb", "<cmd>GitBlameToggle<CR>", { desc = "Toggle Git Blame" })
		end,
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			"nvim-telescope/telescope.nvim",
		},
		config = function()
			vim.keymap.set("n", "mg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
			vim.keymap.set("n", "mc", "<cmd>Neogit commit<CR>", { desc = "Open Neogit commit" })
		end,
	},
}
