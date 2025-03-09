return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				window = {
					documentation = {
						max_height = 15,
						max_width = 20,
						border = "rounded",
					},
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<A-n>"] = cmp.mapping.select_next_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<A-p>"] = cmp.mapping.select_prev_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<A-b>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<A-f>"] = cmp.mapping.select_next_item(),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<A-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<A-space>"] = cmp.mapping.complete({}),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<A-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<A-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "vim-dadbod-completion" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer", keyword_length = 5 },
				},
			})
		end,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},
}
