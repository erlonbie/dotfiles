-- return {
-- 	-- filetypes = { "*" },
-- 	"NvChad/nvim-colorizer.lua",
-- 	filetypes = {
-- 		"css",
-- 		"javascript",
-- 		"lua",
-- 		"vim",
-- 		"toml",
-- 		"svelte",
-- 		"typescript",
-- 		"rust",
-- 		"php",
-- 		"c",
-- 		"cpp",
-- 		"python",
-- 		"html",
-- 		"go",
-- 		"java",
-- 	},
-- 	opts = {
-- 		user_default_options = {
-- 			RGB = true, -- #RGB hex codes
-- 			RRGGBB = true, -- #RRGGBB hex codes
-- 			names = true, -- "Name" codes like Blue or blue
-- 			RRGGBBAA = true, -- #RRGGBBAA hex codes
-- 			AARRGGBB = true, -- 0xAARRGGBB hex codes
-- 			rgb_fn = true, -- CSS rgb() and rgba() functions
-- 			hsl_fn = true, -- CSS hsl() and hsla() functions
-- 			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- 			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- 			-- Available modes for `mode`: foreground, background,  virtualtext
-- 			mode = "background", -- Set the display mode.
-- 			-- Available methods are false / true / "normal" / "lsp" / "both"
-- 			-- True is same as normal
-- 			tailwind = true, -- Enable tailwind colors
-- 			-- parsers can contain values used in |user_default_options|
-- 			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
-- 			virtualtext = "■",
-- 			-- update color values even if buffer is not focused
-- 			-- example use: cmp_menu, cmp_docs
-- 			always_update = false,
-- 		},
-- 		-- all the sub-options of filetypes apply to buftypes
-- 		buftypes = {},
-- 	},
-- }


local M = {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("colorizer").setup {
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "astro",
      "lua",
    },
    user_default_options = {
      names = true,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = "both",
    },
    buftypes = {},
  }
end

return M
