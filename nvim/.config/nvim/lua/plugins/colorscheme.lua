local M = {
	"rebelot/kanagawa.nvim",
	dependencies = {
		-- "folke/tokyonight.nvim",
		-- "lunarvim/colorschemes", -- A bunch of colorschemes you can try out
		-- "lunarvim/darkplus.nvim",
		-- "lunarvim/onedarker.nvim",
		"sainnhe/gruvbox-material",
		-- "Mofiqul/dracula.nvim",
		-- "lunarvim/horizon.nvim",
		"Mofiqul/vscode.nvim",
		-- { "catppuccin/nvim", name = "catppuccin" },
	},

	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	local status_ok, kanagawa = pcall(require, "kanagawa")
	if not status_ok then
		return
	end

	kanagawa.setup({
		colors = {
			palette = {
			},
			theme = {
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
			return {
				FloatBorder = { bg = "none" },
				WhichKeyBorder = { fg = colors.theme.syn.type, bold = true },
			}
		end,
	})

	local colorscheme = "kanagawa"
	-- local colorscheme = "tokyonight"
	-- local colorscheme = "gruvbox-material"
	-- local colorscheme = "vscode"
	-- local colorscheme = "catppuccin-latte"
	-- local colorscheme = "catppuccin-frappe"
	-- local colorscheme = "catppuccin-macchiato"
	-- local colorscheme = "catppuccin-mocha"
	-- local colorscheme = "horizon"
	-- vim.g.gruvbox_material_italic_keyword = true
	-- vim.g.gruvbox_material_italic_functions = false
	-- vim.g.gruvbox_material_italic_comments = true
	-- vim.g.gruvbox_material_italic_loops = true
	-- vim.g.gruvbox_material_italic_conditionals = true

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		-- vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end
-- vim.cmd.colorscheme "darkplus"
end

return M


-- local M = {
--   -- "LunarVim/primer.nvim",
--   "LunarVim/darkplus.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- function M.config()
--   -- vim.cmd.colorscheme "primer_dark"
--   vim.cmd.colorscheme "darkplus"
-- end
--
-- return M
