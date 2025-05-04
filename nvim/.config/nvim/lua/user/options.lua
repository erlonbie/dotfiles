vim.deprecate = function() end
vim.g.gui_font_default_size = 18.0
vim.g.gui_font_size = vim.g.gui_font_default_size
-- vim.g.gui_font_face = "FiraCode Nerd Font Mono"
vim.g.gui_font_face = "MonoLisa Nerd Font Mono"
-- vim.g.gui_font_face = "FantasqueSansMono Nerd Font Mono"
vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
	vim.g.gui_font_size = vim.g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
	vim.g.gui_font_size = vim.g.gui_font_default_size
	RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i" }, "<C-+>", function()
	ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-->", function()
	ResizeGuiFont(-1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-BS>", function()
	ResetGuiFont()
end, opts)

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	-- fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	pumblend = 10, -- pop up menu transparency
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = false, -- enable persistent undo
	-- updatetime = 100, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	laststatus = 3,
	showcmd = false,
	ruler = false,
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	-- guifont = "monospace:h12",               -- the font used in graphical neovim applications
	guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size), -- the font used in graphical neovim applications

	colorcolumn = "80",
	-- colorcolumn = "120",
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "

-- vim.cmd([[set viminfo="NONE"]])

-- Neovide
vim.cmd([[
    let g:neovide_opacity=50.0
    let g:neovide_remember_window_size=v:true
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_trail_length=0.1
    let g:neovide_cursor_antialiasing=v:true
    let g:neovide_cursor_unfocused_outline_width=10.125
    let g:neovide_cursor_vfx_mode = "railgun" "railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
    let g:neovide_cursor_vfx_opacity=0.5
    let g:neovide_cursor_vfx_particle_lifetime=0.1
    let g:neovide_cursor_vfx_particle_density=200.0
    let g:neovide_cursor_vfx_particle_speed=400.0
]])

vim.cmd([[
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey20
    " hi Normal guifg=#d4be98 guibg=#32302f
]])

vim.cmd([[
    let g:mkdp_port = '8999'
]])



-- if vim.fn.has "mac" == 1 then
-- vim.cmd([[
--   let g:UltiSnipsSnippetsDir = '/Users/erlonbie/.config/nvim/mysnippets/'
--   let g:UltiSnipsSnippetDirectories = ['/Users/erlonbie/.config/nvim/mysnippets', 'UltiSnips']
--   " let g:vimspector_enable_mappings = 'HUMAN'
-- ]])
-- else
-- vim.cmd([[
--   let g:UltiSnipsSnippetsDir = '/home/erlonbie/.config/nvim/mysnippets/'
--   let g:UltiSnipsSnippetDirectories = ['/home/erlonbie/.config/nvim/mysnippets', 'UltiSnips']
--   " let g:vimspector_enable_mappings = 'HUMAN'
-- ]])
-- end


-- vim.cmd([[
-- " coc wants javascriptreact and typescriptreact, the others are to support
-- " honza/vim-snippets snippets
-- autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
-- autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react
-- ]])

-- vim.opt.shortmess:append "c"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd([[set iskeyword+=-]])
vim.cmd [[set clipboard+=unnamedplus]]
vim.cmd [[highlight CursorLineNr  gui=nocombine guifg=#cba6f8]]

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})
