local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

return {
	-- Commands used with 'Jaq'
	"is0n/jaq-nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {
		cmds = {
			-- Default UI used (see `Usage` for options)
			default = "term",

			-- Uses external commands such as 'g++' and 'cargo'
			external = {
				typescript = "deno run %",
				javascript = "node %",
				-- markdown = "glow %",
				python = "python3 %",
				lua = "lua %",
				php = "php %",
				-- rust = "rustc % && ./$fileBase && rm $fileBase",
				rust = "cargo run --release",
				cpp = "g++ % -o $fileBase && ./$fileBase",
				c = "gcc % -o $fileBase && ./$fileBase",
				go = "go run %",
				sh = "sh %",
				java = "javac --release 17 $fileBase.java && java $fileBase && rm *.class",
				-- java = "mvn exec:java",
				-- kotlin = "kotlinc $fileBase.kt && kotlin $fileBase",
				kotlin = "./gradlew run",
			},

			-- Uses internal commands such as 'source' and 'luafile'
			internal = {
				-- lua = "luafile %",
				-- vim = "source %",
			},
		},

		behavior = {
			-- Default type
			default = "terminal",

			-- Start in insert mode
			startinsert = false,

			-- Use `wincmd p` on startup
			wincmd = false,

			-- Auto-save files
			autosave = false,
		},

		-- UI settings
		ui = {
			-- Floating Window / FTerm settings
			float = {
				-- Floating window border (see ':h nvim_open_win')
				border = "rounded",
				borderhl    = "FloatBorder",
				winhl     = "Normal",

				-- Num from `0 - 1` for measurements
				height    = 0.8,
				width     = 0.8,
				x         = 0.5,
				y         = 0.5,

				-- Highlight group for floating window/border (see ':h winhl')
				border_hl = "FloatBorder",
				float_hl  = "Normal",

				-- Floating Window Transparency (see ':h winblend')
				blend     = 0,
			},

			terminal = {
				-- Position of terminal
				position = "vert",

				-- Open the terminal without line numbers
				line_no = false,

				-- Size of terminal
				size = 60,
			},
		},
	},
}
