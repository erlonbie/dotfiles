	local M = {
		"f-person/git-blame.nvim",
		init = function()
			vim.g.gitblame_message_template = " <author> - <date> - <summary> - <sha>"
			vim.g.gitblame_enabled = false
		end,
		dependencies = {
			"tpope/vim-fugitive"
		}
	}

	return M
