-- local M = {
-- 	"zbirenbaum/copilot.lua",
-- 	cmd = "Copilot",
-- 	-- event = "InsertEnter",
-- 	-- event = "VimEnter",
-- }
--
-- function M.config()
-- 	-- require("user.copilot")
-- 	require("copilot").setup({
-- 		panel = {
-- 			enabled = true,
-- 			auto_refresh = false,
-- 			keymap = {
-- 				jump_prev = "[[",
-- 				jump_next = "]]",
-- 				accept = "<CR>",
-- 				refresh = "gr",
-- 				open = "<M-CR>",
-- 			},
-- 			layout = {
-- 				position = "bottom", -- | top | left | right
-- 				ratio = 0.4,
-- 			},
-- 		},
-- 		suggestion = {
-- 			enabled = true,
-- 			auto_trigger = false,
-- 			debounce = 75,
-- 			keymap = {
-- 				accept = "<c-a>",
-- 				accept_word = false,
-- 				accept_line = false,
-- 				next = "<c-b>",
-- 				prev = "<c-B>",
-- 				dismiss = "<C-]>",
-- 			},
-- 		},
-- 		filetypes = {
-- 			yaml = true,
-- 			markdown = false,
-- 			help = false,
-- 			gitcommit = false,
-- 			gitrebase = false,
-- 			hgcommit = false,
-- 			svn = false,
-- 			cvs = false,
-- 			["."] = false,
-- 		},
-- 		copilot_node_command = "node", -- Node.js version must be > 16.x
-- 		server_opts_overrides = {},
-- 	})
-- 	require("copilot_cmp").setup({
-- 		formatters = {
-- 			insert_text = require("copilot_cmp.format").remove_existing,
-- 		},
-- 	})
-- end
--
-- -- dependencies = {
-- -- 	{
-- -- 		"zbirenbaum/copilot-cmp",
-- -- 		dependencies = { "copilot.lua" },
-- -- 		config = function()
-- -- 			require("copilot_cmp").setup({
-- -- 				formatters = {
-- -- 					insert_text = require("copilot_cmp.format").remove_existing,
-- -- 				},
-- -- 			})
-- -- 		end,
-- -- 	},
-- -- },
--
-- return M


local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  -- event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
}

function M.config()
  require("copilot").setup {
    panel = {
      keymap = {
        -- jump_next = "<c-j>",
        -- jump_prev = "<c-k>",
        accept = "<c-l>",
        refresh = "r",
        open = "<M-CR>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<M-l>",
        next = "<c-j>",
        prev = "<c-k>",
        dismiss = "<c-h>",
      },
    },
    filetypes = {
			yaml = true,
      markdown = true,
      help = false,
      gitcommit = false,
      gitrebase = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node",
  }

  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

  -- require("copilot_cmp").setup()
end

return M
