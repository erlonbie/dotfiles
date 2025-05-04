local icons = require "user.icons"

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		-- signs = {
		-- 	-- add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- 	-- change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- 	-- delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	-- topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	-- changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- 	add = { hl = "GitSignsAdd", text = "✚", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- 	change = { hl = "GitSignsChange", text = "✹", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- 	delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	changedelete = {
		-- 		hl = "GitSignsChange",
		-- 		text = "▎",
		-- 		numhl = "GitSignsChangeNr",
		-- 		linehl = "GitSignsChangeLn",
		-- 	},
		-- 	untracked = { hl = "GitSignsAdd", text = "✭", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- },
    signs = {
      add = {
        hl = vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' }),
        text = icons.ui.BoldLineLeft,
        numhl = vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' }),
        linehl = vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' }),
      },
      change = {
        hl = vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' }),
        text = icons.ui.BoldLineLeft,
        numhl = vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' }),
        linehl = vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' }),
      },
      delete = {
        hl = vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' }),
        text = icons.ui.TriangleShortArrowRight,
        numhl = vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' }),
        linehl = vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' }),
      },
      topdelete = {
        hl = vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' }),
        text = icons.ui.TriangleShortArrowRight,
        numhl = vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' }),
        linehl = vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' }),
      },
      changedelete = {
        hl = vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' }),
        text = icons.ui.BoldLineLeft,
        numhl = vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' }),
        linehl = vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' }),
      },
    },
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>, <abbrev_sha> - <summary> ",
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 500,
			ignore_whitespace = false,
      virt_text_priority = 100,
		},
		-- current_line_blame_formatter_opts = {
		-- 	relative_time = true,
		-- },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		-- yadm = {
		-- 	enable = false,
		-- },
	},
}
