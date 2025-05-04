return {
	"Wansmer/treesj",
  enabled = true,
  lazy = true,
  event = "VeryLazy",
	keys = { "<space>m", "<space>j", "<space>s" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup({ --[[ your config ]]
		})
	end,
}
