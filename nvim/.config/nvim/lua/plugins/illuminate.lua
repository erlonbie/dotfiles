-- -- vim.g.Illuminate_delay = 0
-- vim.g.Illuminate_highlightUnderCursor = 1
-- vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "DressingSelect", "harpoon" }
-- vim.g.Illuminate_highlightUnderCursor = 1
-- vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<a-p>",
-- 	'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
-- 	{ noremap = true }
-- )
-- return {}

local M = {
	"RRethy/vim-illuminate",
	-- event = "VeryLazy",
}

function M.config()
	-- vim.g.Illuminate_highlightUnderCursor = 1
	-- vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "DressingSelect", "harpoon" }
	vim.g.Illuminate_highlightUnderCursor = 1

  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	 local key_n = ""
	 local key_p = ""
	 if vim.fn.has("mac") == 1 then
	   key_n = "<M-n>"
	   key_p = "<M-p>"
	 else
	   key_n = "<a-n>"
	   key_p = "<a-p>"
	 end
	vim.api.nvim_set_keymap(
		"n",
		key_n,
		'<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
		{ noremap = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		key_p,
		'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
		{ noremap = true }
	)
	require("illuminate").configure({
		filetypes_denylist = {
			"mason",
			"harpoon",
			"DressingInput",
			"NeogitCommitMessage",
			"qf",
			"dirvish",
			"oil",
			"minifiles",
			"fugitive",
			"alpha",
			"NvimTree",
			"lazy",
			"NeogitStatus",
			"Trouble",
			"netrw",
			"lir",
			"DiffviewFiles",
			"Outline",
			"Jaq",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
			"neo-tree",
		},
	})
end

return M
