local M = {
	"rebelot/kanagawa.nvim",
	event = "VeryLazy"
}

function M.config()
	local status_ok, kanagawa = pcall(require, "kanagawa")
	if not status_ok then
		return
	end

	kanagawa.setup({
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		-- colors = {                   -- add/modify theme and palette colors
		--     palette = {},
		--     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		-- },
		colors = {
			palette = {
				-- change all usages of these colors
				-- sumiInk0 = "#000000",
				-- fujiWhite = "#FFFFFF",
			},
			theme = {
				-- change specific usages for a certain theme, or for all of them
				wave = {
					ui = {
						float = {
							bg = "none",
						},
					},
				},
				dragon = {
					syn = {
						parameter = "yellow",
					},
				},
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		overrides = function(colors) -- add/modify highlights
			local theme = colors.theme
			return {
				-- NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				-- FloatTitle = { bg = "none" },
				-- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
				-- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				-- PmenuSbar = { bg = theme.ui.bg_m1 },
				-- PmenuThumb = { bg = theme.ui.bg_p2 },
				-- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
				--
				-- -- Popular plugins that open floats will link to NormalFloat by default;
				-- -- set their background accordingly if you wish to keep them dark and borderless
				-- LazyNormal = { bg = theme.ui.bg_m1, fg = theme.ui.fg_dim },
				-- MasonNormal = { bg = theme.ui.bg_m1, fg = theme.ui.fg_dim },
				-- Assign a static color to strings
				-- String = { fg = colors.palette.carpYellow, italic = true },
				-- theme colors will update dynamically when you change theme!
				-- SomePluginHl = { fg = colors.theme.syn.type, bold = true },
				WhichKeyBorder = { fg = colors.theme.syn.type, bold = true },
				-- WhichKeyBorder = { fg = "#DCD7BA", bold = false },
			}
		end,
		theme = "wave", -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	})
end

return M
