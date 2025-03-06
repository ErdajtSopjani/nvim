return {
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- just transparency
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NvimTreeNormal",
					"NvimTreeNormalNC",
					-- Add other groups
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>tt", ":TransparentToggle<CR>", { noremap = true, silent = true })
		end,
	},

	{ "numToStr/Comment.nvim", opts = {} }, -- "gc" to comment visual regions/lines

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			-- Document existing key chains
			require("which-key").setup({
				["<leader>c"] = { name = "[C]ode" },
				["<leader>d"] = { name = "[D]ocument" },
				["<leader>r"] = { name = "[R]ename" },
				["<leader>s"] = { name = "[S]earch" },
				["<leader>w"] = { name = "[W]orkspace" },
			})
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

	{ -- auto close html tags
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set("i", "<A-j>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
			vim.keymap.del("i", "<Tab>")
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.keymap.set("i", "<A-w>", "<Plug>(copilot-accept-word)")
			vim.keymap.set("i", "<A-n>", "<Plug>(copilot-next)")
		end,
	},

	{ -- find/replace across multiple files
		"nvim-pack/nvim-spectre",
		keys = {
			{ "mfr", "<cmd>Spectre<cr>", mode = { "n" } },
		},
		config = function()
			require("spectre").setup({ is_block_ui_break = true })
		end,
	},
}
