-- lua/snacks/init.lua
local config = require("plugins.utils.snacks.config")
local keys = require("plugins.utils.snacks.keys")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = config,
	keys = keys,
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...)
					require("snacks").debug.inspect(...)
				end
				_G.bt = function()
					require("snacks").debug.backtrace()
				end
				vim.print = _G.dd

				local S = require("snacks")
				S.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				S.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				S.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				S.toggle.diagnostics():map("<leader>ud")
				S.toggle.line_number():map("<leader>ul")
				S.toggle
					.option("conceallevel", {
						off = 0,
						on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
					})
					:map("<leader>uc")
				S.toggle.treesitter():map("<leader>uT")
				S.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				S.toggle.inlay_hints():map("<leader>uh")
				S.toggle.indent():map("<leader>ug")
				S.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
