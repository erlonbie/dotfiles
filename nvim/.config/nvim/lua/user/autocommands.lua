vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "Jaq", "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "DressingSelect", "tsplayground" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "Jaq" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> <m-r> :close<CR>
      " nnoremap <silent> <buffer> <m-r> <NOP>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.lua", "*.java"},
	callback = function()
		vim.cmd([[
      set tabstop=2
      set shiftwidth=2
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.cpp", "*.py"},
	callback = function()
		vim.cmd([[
      set tabstop=4
      set shiftwidth=4
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "php"},
	callback = function()
		vim.cmd([[
      set tabstop=4
      set shiftwidth=4
    ]])
	end,
  -- set virtualedit=all
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "" },
	callback = function()
		local buf_ft = vim.bo.filetype
		if buf_ft == "" or buf_ft == nil then
			vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <c-j> j<CR>
      nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]])
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "term://*" },
	callback = function()
		vim.cmd("startinsert!")
		vim.cmd("set cmdheight=1")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lir" },
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

vim.cmd("autocmd FileType mason setlocal winblend=10")
vim.cmd("autocmd FileType lazy setlocal winblend=10")

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.cmd("autocmd bufwritepost ~/.config/kitty/kitty.conf :silent !kill -SIGUSR1 $KITTY_PID")
-- vim.cmd("autocmd bufwritepost ~/.config/kitty/kitty.conf :silent !kill -SIGUSR1 $(pgrep kitty)")

local _ft = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "Outline",
	callback = function()
		vim.wo.signcolumn = "no"
	end,
	group = _ft,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("hi link illuminatedWord LspReferenceText")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

-- vim.filetype.add({
--   pattern = { [".*/hyprland%.conf"] = "hyprlang" },
--
-- })
--
-- -- Define an autocommand group for custom settings per filetype
-- vim.api.nvim_create_augroup('CustomFileTypeSettings', { clear = true })
--
-- -- Set the comment string for 'hypr' filetype
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'hypr', -- Match the filetype
--     group = 'CustomFileTypeSettings', -- Associate with the defined group
--     callback = function()
-- 	print("entrei nessa merda")
--         -- Set the comment string for 'hypr' filetype
--         -- Update '//' to the desired comment string for 'hypr' files
--         vim.opt_local.commentstring = '# %s'
--     end,
-- })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.jsx", "*.tsx" },
	callback = function()
		vim.cmd([[
" coc wants javascriptreact and typescriptreact, the others are to support
" honza/vim-snippets snippets
" autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
" autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react
  setlocal filetype=javascript
  " setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
  " setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react
    ]])
	end,
})


vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "uv.lock"},
  callback = function()
    vim.cmd([[
  setlocal filetype=toml
  ]])
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  -- group = inlay_hints_group,
  desc = 'Disable inlay hints',
  -- buffer = bufnr,
  callback = function()
    -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    vim.lsp.inlay_hint.enable(true)
  end,
})
vim.api.nvim_create_autocmd('InsertEnter', {
  -- group = inlay_hints_group,
  desc = 'Enable inlay hints',
  -- buffer = bufnr,
  callback = function()
    -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    vim.lsp.inlay_hint.enable(false)
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  -- group = inlay_hints_group,
  desc = 'Disable inlay hints',
  -- buffer = bufnr,
  callback = function()
    -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    vim.lsp.inlay_hint.enable(true)
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 50m")
  end,
})


vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nvcheatsheet", "neo-tree", "neo-tree-popup" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
		vim.wo.foldcolumn = "0"
  end
})

-- vim.api.nvim_create_autocmd(
--   { 'VimEnter' },
--   {
--     callback = function()
--       local handle = io.popen('eval "$(fnm env)"; env')
--       if handle == nil then return end
--       local env_vars = handle:read("*a")
--       if env_vars == nil then return end
--         
--       for line in env_vars:gmatch("[^\r\n]+") do
--         local key, value = line:match("([^=]+)=(.*)")
--         if key == nil then return end
--         if value == nil then return end
--         vim.env[key] = value
--       end
--
--       handle:close()
--     end
--   }
-- )

-- -- Auto formatting
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         local mode = vim.api.nvim_get_mode().mode
--         local filetype = vim.bo.filetype
--         if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
--             vim.cmd('lua vim.lsp.buf.format()')
--         else
--         end
--     end
-- })
