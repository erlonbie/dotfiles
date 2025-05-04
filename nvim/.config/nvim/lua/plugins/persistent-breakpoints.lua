local M = {
	"Weissle/persistent-breakpoints.nvim",
  enabled = true,
  event = "VeryLazy",
}

function M.config()
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Save breakpoints to file automatically.
-- keymap("n", "<leader>tbp", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>tbc", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
-- keymap("n", "<leader>tbv", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)

return M
