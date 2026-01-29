local M = {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	dependencies = {
		"s1n7ax/nvim-comment-frame",
		"abecodes/tabout.nvim",
		"danymat/neogen",
		"iamcco/markdown-preview.nvim",
   -- "OXY2DEV/markview.nvim",
		-- "preservim/tagbar",
		-- "theRealCarneiro/hyprland-vim-syntax",
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",
    {
      'fei6409/log-highlight.nvim',
      config = function()
        require('log-highlight').setup {}
      end,
    }
	},
	lazy = false,
	priority = 1000
}

function M.config()
	local status_ok, configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	vim.api.nvim_set_hl(0, "my_purple", { fg = "#7D6C9C" })
	vim.api.nvim_set_hl(0, "my_orange", { fg = "#D2865B" })
	vim.api.nvim_set_hl(0, "my_blue", { fg = "#6C84B8" })
	vim.api.nvim_set_hl(0, "my_salmon", { fg = "#AF6C85" })
	vim.api.nvim_set_hl(0, "my_brown", { fg = "#C0A376" })
	vim.api.nvim_set_hl(0, "my_darkgreen", { fg = "#6A8D7C" })

	-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
	-- ft_to_parser.motoko = "typescript"
	-- require("ts_context_commentstring").setup({})
	-- vim.g.skip_ts_context_commentstring_module = true

	configs.setup({
		-- markid = { enable = true },
		auto_install = true,
		-- ensure_installed = "all", -- one of "all" or a list of languages
		-- ensure_installed = {"python" }, -- one of "all" or a list of languages
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
		-- ignore_install = { "php" }, -- List of parsers to ignore installing
		-- highlight = {
		--   -- use_languagetree = true,
		--   enable = true, -- false will disable the whole extension
		--   -- disable = { "css", "html" }, -- list of language that will be disabled
		--   -- disable = { "css", "markdown" }, -- list of language that will be disabled
		--   disable = { "markdown" }, -- list of language that will be disabled
		--   additional_vim_regex_highlighting = true,
		-- },
		highlight = {
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = false,
			-- disable = function(lang, buf)
			-- 	if vim.tbl_contains({ "latex" }, lang) then
			-- 		return true
			-- 	end
			--
			-- 	local max_filesize = 1024 * 1024
			-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			-- 	local line_count = vim.api.nvim_buf_line_count(buf)
			-- 	-- if ok and stats and stats.size > max_filesize then
			-- 	if ok and stats and (stats.size > max_filesize or line_count > 2000) then
			-- 		-- if lvim.builtin.illuminate.active then
			-- 		-- 	pcall(require("illuminate").pause_buf)
			-- 		-- end
			--
			-- 		vim.schedule(function()
			-- 			vim.api.nvim_buf_call(buf, function()
			-- 				vim.cmd("setlocal noswapfile noundofile")
			--
			-- 				if vim.tbl_contains({ "json" }, lang) then
			-- 					vim.cmd("NoMatchParen")
			-- 					vim.cmd("syntax off")
			-- 					vim.cmd("syntax clear")
			-- 					vim.cmd("setlocal nocursorline nolist bufhidden=unload")
			--
			-- 					vim.api.nvim_create_autocmd({ "BufDelete" }, {
			-- 						callback = function()
			-- 							vim.cmd("DoMatchParen")
			-- 							vim.cmd("syntax on")
			-- 						end,
			-- 						buffer = buf,
			-- 					})
			-- 				end
			-- 			end)
			-- 		end)
			--
			-- 		-- Log:info("File larger than 1MB, turned off treesitter for this buffer")
			--
			-- 		return true
			-- 	end
			-- end,
		},
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css", "rust" } },
		-- context_commentstring = {
		-- 	enable = true,
		-- 	enable_autocmd = false,
		-- },
		autotag = {
			enable = true,
			disable = { "xml", "markdown" },
		},
		rainbow = {
			enable = true,
			hlgroups = {
				"my_purple",
				"my_orange",
				"my_blue",
				"my_salmon",
				"my_brown",
				"my_darkgreen",
			},
			-- colors = {
			--   -- "#68a0b0",
			--   -- "#946EaD",
			--   -- "#c7aA6D",
			--   "Cornsilk",
			--   "Gold",
			--   "Orchid",
			--   "DodgerBlue",
			--   "Salmon",
			--   "LawnGreen",
			-- },
			disable = { "html" },
		},
		playground = {
			enable = false,
		},
	})
end

return M
