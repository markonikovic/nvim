return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
      ensure_installed = { "go", "gomod", "gosum", "python","javascript", "typescript"},
			highlight = { enable = true },
			indent = { enable = true },
      auto_install = true,
      auto_sync = false
		})
	end,
}
