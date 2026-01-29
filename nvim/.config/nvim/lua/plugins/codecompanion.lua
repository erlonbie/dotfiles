return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "openai",
				model = "gpt-4o-mini",
			},
		},
		adapters = {
			http = {
				openai = function()
					return require("codecompanion.adapters").extend("openai", {
						opts = {
							stream = true,
						},
						env = {
							api_key = "OPENAI_API_KEY",
						},
						schema = {
							model = {
								default = function()
									return "gpt-4o-mini"
								end,
							},
						},
					})
				end,
			},
		},
	},
}
