return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						require("luasnip").expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						require("luasnip").jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:CmpItemAbbr,FloatBorder:CmpBorder",
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:CmpItemAbbr,FloatBorder:CmpBorder",
				},
			},
		})
		-- Gruvbox palette
		local colors = {
			bg = "#282828",
			fg = "#ebdbb2",
			yellow = "#fabd2f",
			blue = "#83a598",
			aqua = "#8ec07c",
			green = "#b8bb26",
			orange = "#fe8019",
			red = "#fb4934",
			purple = "#d3869b",
		}
		-- Transparent-friendly Gruvbox styling
		vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#ebdbb2", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#928374", bg = "NONE", strikethrough = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#83a598", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#8ec07c", bg = "NONE", italic = true })
		vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#fe8019", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#d3869b", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#b8bb26", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#fabd2f", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#fb4934", bg = "NONE" })

		vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#665c54", bg = "NONE" })
	end,
}
