return {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*",
	event = "VeryLazy",
  cmd = {
    "MultipleCursorsJumpNextMatch",
    "MultipleCursorsAddJumpNextMatch",
    "MultipleCursorsAddDown",
    "MultipleCursorsAddUp"
  },
	opts = {
		enable_split_paste = true,
		custom_key_maps = {
			-- j and k: use gj/gk when count is 0
			{
				{ "n", "x" },
				{ "j", "<Down>" },
				function(_, count)
					if count == 0 then
						vim.cmd("normal! gj")
					else
						vim.cmd("normal! " .. count .. "j")
					end
				end,
			},
			{
				{ "n", "x" },
				{ "k", "<Up>" },
				function(_, count)
					if count == 0 then
						vim.cmd("normal! gk")
					else
						vim.cmd("normal! " .. count .. "k")
					end
				end,
			},
			{{"n", "x"}, "w", function(_, count)
				if  count ~=0 and vim.api.nvim_get_mode().mode == "n" then
					vim.cmd("normal! " .. count)
				end
				require('spider').motion('w')
			end},

			-- e
			{{"n", "x"}, "e", function(_, count)
				if  count ~=0 and vim.api.nvim_get_mode().mode == "n" then
					vim.cmd("normal! " .. count)
				end
				require('spider').motion('e')
			end},

			-- b
			{{"n", "x"}, "b", function(_, count)
				if  count ~=0 and vim.api.nvim_get_mode().mode == "n" then
					vim.cmd("normal! " .. count)
				end
				require('spider').motion('b')
			end},
		},
		-- pre_hook = function()
		-- 	vim.opt.cursorline = false
		-- 	vim.cmd("NoMatchParen")
		-- end,
		-- post_hook = function()
		-- 	vim.opt.cursorline = true
		-- 	vim.cmd("DoMatchParen")
		-- end,
		pre_hook = function()
			require('nvim-autopairs').disable()
		end,

		post_hook = function()
			require('nvim-autopairs').enable()
		end,
	},
	keys = {
		{ "<M-b>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "i" } },
		{ "<M-w>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "i" } },
		{ "<M-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i" } },
		-- { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>" },
		{ "<M-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i" } },
		-- { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>" },
		{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
	},
}
