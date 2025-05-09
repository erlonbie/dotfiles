local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl_shortcut = "Macro"
	return b
end

local icons = require("user.icons")

dashboard.section.header.val = {
	[[                                                                                                           ]],
	[[    ███████╗██████╗░██╗░░░░░░█████╗░███╗░░██╗██╗░██████╗  ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗ ]],
	[[    ██╔════╝██╔══██╗██║░░░░░██╔══██╗████╗░██║╚█║██╔════╝  ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║ ]],
	[[    █████╗░░██████╔╝██║░░░░░██║░░██║██╔██╗██║░╚╝╚█████╗░  ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║ ]],
	[[    ██╔══╝░░██╔══██╗██║░░░░░██║░░██║██║╚████║░░░░╚═══██╗  ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║ ]],
	[[    ███████╗██║░░██║███████╗╚█████╔╝██║░╚███║░░░██████╔╝  ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║ ]],
	[[    ╚══════╝╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝░░╚══╝░░░╚═════╝░  ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝ ]],
}
-- []

-- https://fontmeme.com/japanese/ - generate image
-- https://arc.net/l/quote/rdjlvicq generate ascii from image
-- dashboard.section.header.val = {
-- 	[[                                                       ████   ████            ███████████████████       ████                    ]],
-- 	[[    ████████████████████                               ████   ████            ███████████████████      ███████                  ]],
-- 	[[   ████████████████████                                ████   ████            ███████████████████        ███████        ██      ]],
-- 	[[          █████                                        ████   ████            ████           ████          ████        ████     ]],
-- 	[[          █████                                        ████   ████            ████           ████                    ██████     ]],
-- 	[[          █████            █████████████████████       ████   ████     ██     ████           ████                  ███████      ]],
-- 	[[          █████           █████████████████████        ████   ████   █████    ████           ████                ███████        ]],
-- 	[[          █████                                       █████   ████ ███████    ████           ████             ████████          ]],
-- 	[[  ██████████████████████                             █████    ██████████      ███████████████████         ██████████            ]],
-- 	[[ ██████████████████████                            ██████     ████████        ███████████████████     ███████████               ]],
-- 	[[                                                   █████      █████           ████           ████      ███████                  ]],
-- }

dashboard.section.buttons.val = {
	button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
	button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
	button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
	button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
	button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
	-- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
	button("s", icons.ui.SignIn .. " Find Session", ":SessionSearch<CR>"),
	button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
	button("u", icons.ui.CloudDownload .. " Update", ":Lazy sync<CR>"),
	button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}
local function footer()
	return "@erlonbie - github.com/erlonbie"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Keyword"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
end

return M
