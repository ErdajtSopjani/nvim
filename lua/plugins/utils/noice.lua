return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			messages = { view = "notify", view_warn = "notify" },
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				progress = {
					enabled = true,
					throttle = 10000 / 30,
				},
			},
			presets = {
				bottom_search = false,
				-- command_palette = true,
				long_message_to_split = true,
				-- inc_rename = true,
				lsp_doc_border = true,
			},

			errors = {
				-- options for the message history that you get with `:Noice`
				view = "notify",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					{
						filter = {
							event = "lsp",
							kind = "progress",
							cond = function(message)
								local client = vim.tbl_get(message.opts, "progress", "client")
								return client == "lua_ls"
							end,
						},
						opts = { skip = true },
					},
					view = "notify",
				},
			},
		},
	},
}
