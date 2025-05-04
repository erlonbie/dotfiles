M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
 local keymap = vim.api.nvim_set_keymap
-- local keymap = vim.keymap.set

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<c-h>", "<C-w>h", opts)
keymap("n", "<c-j>", "<C-w>j", opts)
keymap("n", "<c-k>", "<C-w>k", opts)
keymap("n", "<c-l>", "<C-w>l", opts)
keymap("t", "<c-h>", "<c-\\><c-n><c-w>h", opts)
keymap("t", "<c-j>", "<c-\\><c-n><c-w>j", opts)
keymap("t", "<c-k>", "<c-\\><c-n><c-w>k", opts)
keymap("t", "<c-l>", "<c-\\><c-n><c-w>l", opts)

keymap("n", "<m-h>", "^", opts)
keymap("n", "<m-l>", "$", opts)

-- keymap("n", "n", "nzz", opts)
-- keymap("n", "N", "Nzz", opts)
-- keymap("n", "*", "*zz", opts)
-- keymap("n", "#", "#zz", opts)
-- keymap("n", "g*", "g*zz", opts)
-- keymap("n", "g#", "g#zz", opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts)
keymap("n", "<s-enter>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)
-- keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
-- keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
-- keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
-- keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
-- keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- -- move current tab to previous position
-- keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- -- move current tab to next position
-- keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- I hate typing these
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("x", "H", "^", opts)
keymap("x", "L", "$", opts)
keymap("o", "H", "^", opts)
keymap("o", "L", "$", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)


if vim.fn.has("mac") == 1 then
  keymap("n", "<M-k>", "<Esc>:m .-2<CR>==", opts)
  keymap("n", "<M-j>", "<Esc>:m .+1<CR>==", opts)
else
  keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
  keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
end

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==gi", opts)
keymap("v", "<A-k>", ":m .-2<CR>==gi", opts)
keymap("v", "p", '"_dP', opts)

-- Ilay hints
function Toggle_inlay_hints()
    -- vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}), {0})
    -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
end
keymap("n", "<leader>il", ":lua Toggle_inlay_hints()<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


if vim.fn.has("mac") == 1 then
  keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)
else
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
end

--File tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Git
keymap("n", "<leader>jj", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>kk", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gt", ":Gitsigns toggle_signs<CR>", opts)
keymap("v", "<leader>sh", ":Gitsigns stage_hunk<CR>", opts)

-- Comment
keymap("v", "<C-c>", "gc", term_opts)
keymap("n", "<C-c>", "gc", term_opts)

--Copilot
-- keymap("n", "<leader>co", ":lua require('copilot').setup()<CR>", opts)
keymap("n", "<leader>ce", ":Copilot enable<CR>", opts)
keymap("n", "<leader>cd", ":Copilot disable<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>bl", ":BookmarkList<CR>", opts)
keymap("n", "<leader>bn", ":BookmarkNext<CR>", opts)
keymap("n", "<leader>bp", ":BookmarkPrev<CR>", opts)
keymap("n", "<leader>bt", ":BookmarkToggle<CR>", opts)
keymap("n", "<leader>mm", ":lua require(\"harpoon.mark\").add_file()", opts)

keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>gl", "<cmd> lua _LAZYGIT_TOGGLE()<CR>", opts)

keymap("n", "<leader>rf", ":Jaq float<CR>", opts)
keymap("n", "<leader>rr", ":Lab code run<CR>", opts)
keymap("n", "<leader>rs", ":Lab code stop<CR>", opts)

-- vim-tmux-navigator
-- vim.cmd("let g:tmux_navigator_no_mappings = 1")
-- keymap("n", "<C-h>", "<C-U>TmuxNavigateLeft<cr>", opts)
-- keymap("n", "<C-j>", "<C-U>TmuxNavigateDown<cr>", opts)
-- keymap("n", "<C-k>", "<C-U>TmuxNavigateUp<cr>", opts)
-- keymap("n", "<C-l>", "<C-U>TmuxNavigateRight<cr>", opts)

-- noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
-- noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
-- noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
-- noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
-- noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

--Tagbar
-- keymap("n", "<leader>tb", ":AerialToggle<CR>", opts)
vim.cmd(":command Q q")
vim.cmd(":command W w")
vim.cmd(":command Wq wq")

-- Transparent
-- keymap("n", "<leader>tr", ":TransparentToggle<CR>", opts)

vim.cmd([[
  fun! TrimWhitespace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
  endfun
]])

-- Closing buffers
-- keymap("n", "<leader>x", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<leader>x", "<ESC>:bw <CR>", opts)
keymap("n", "<leader>cab", ":%bdelete|edit #|normal `<CR>", opts)

-- Folding
keymap("n", "zl", "zfi{", opts)

-- Terminal
vim.keymap.set( "t", "<C-esc>", "<c-\\><c-n>", { desc = "Toggle lsp_lines" })

-- Split
keymap("n", "<leader>vs", ":vsplit<CR>", opts)

-- Renaming
keymap("n", "<leader>rl", ":%s///g<Left><Left>", opts)
keymap("n", "<leader>rp", "<cmd>lua require('spectre').open()<CR>", opts)


-- Indent Blankline
keymap("n", "<leader>di", "<cmd>lua require(\"ibl\").setup_buffer(0, { enabled = not require(\"ibl.config\").get_config(0).enabled, })<CR>", opts)

-- Treesitter
-- keymap("n", "<leader>th", ":TSBufToggle highlight<CR>", term_opts)
keymap("n", "<leader>th", ":TSToggle highlight<CR>", term_opts)

-- Carboon
-- vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true })

-- Noice
keymap("n", "<leader>nn", ":Noice history<CR>", term_opts)

-- Twilight
keymap("n", "<leader>z", ":Twilight<CR>", term_opts)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- tailwind bearable to work with
keymap("n", "j", "gj", opts)
keymap("x", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("x", "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

function Toggle_virtual_line()
    local virtual_text_enabled = vim.g.enable_diagnostics_virtual_text
    if virtual_text_enabled then
        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
    else
        vim.diagnostic.config({ virtual_lines = false })
    end
    vim.g.enable_diagnostics_virtual_text = not virtual_text_enabled
end

keymap("n", "<leader>vl", ":lua Toggle_virtual_line()<CR>", opts)
-- keymap("n", "<leader>vt", ":lua require('lsp_lines').toggle()<CR>", opts)

function _G.processLines(startLine, endLine)
 local bufnr = vim.api.nvim_get_current_buf() -- Get the current buffer

    -- Adjust because nvim_buf_get_lines is 0-indexed but line numbers in Vim are 1-indexed
    startLine = startLine - 1

    -- Prevent going beyond the last line of the buffer
    endLine = math.min(endLine, vim.api.nvim_buf_line_count(bufnr))

    local lineNum = startLine

    while lineNum < endLine - 1 do -- Adjust loop condition to prevent out-of-bounds access
        local currentLine = vim.api.nvim_buf_get_lines(bufnr, lineNum, lineNum + 1, false)[1] or ""
        local nextLine = vim.api.nvim_buf_get_lines(bufnr, lineNum + 1, lineNum + 2, false)[1] or ""

        -- Extract the first word from the current and next line
        local currentFirstWord = currentLine:match("^(%S+)")
        local nextFirstWord = nextLine:match("^(%S+)")

        if currentFirstWord and nextFirstWord and currentFirstWord ~= nextFirstWord then
            -- If first words don't match, insert a blank line after the current line
            vim.api.nvim_buf_set_lines(bufnr, lineNum + 1, lineNum + 1, false, {""})
            endLine = endLine + 1 -- Increment endLine because a line was added
        end

        lineNum = lineNum + 1 -- Move to the next line
    end
end

vim.cmd([[
    command! -range ProcessLines lua processLines(<line1>, <line2>)
]])

function _G.toggle_virtual_text()
    local virtual_text_enabled = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not virtual_text_enabled })
end

vim.api.nvim_set_keymap('n', '<leader>vt', ':call v:lua.toggle_virtual_text()<CR>',  {noremap = true, silent = true})

local uv = vim.uv or vim.loop

---@param path string
local function realpath(path)
  return vim.fs.normalize(uv.fs_realpath(path) or path)
end

function _G.on_rename_file(from, to, rename)
  local changes = { files = { {
    oldUri = vim.uri_from_fname(from),
    newUri = vim.uri_from_fname(to),
  } } }

  local clients = (vim.lsp.get_clients or vim.lsp.get_active_clients)()
  for _, client in ipairs(clients) do
    if client.supports_method("workspace/willRenameFiles") then
      local resp = client.request_sync("workspace/willRenameFiles", changes, 1000, 0)
      if resp and resp.result ~= nil then
        vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
      end
    end
  end

  if rename then
    rename()
  end

  for _, client in ipairs(clients) do
    if client.supports_method("workspace/didRenameFiles") then
      client.notify("workspace/didRenameFiles", changes)
    end
  end
end

function _G.rename_file()
  local buf = vim.api.nvim_get_current_buf()
  local old = assert(realpath(vim.api.nvim_buf_get_name(buf)))
  local root = assert(realpath(uv.cwd() or "."))

  if old:find(root, 1, true) ~= 1 then
    root = vim.fn.fnamemodify(old, ":p:h")
  end

  local extra = old:sub(#root + 2)

  vim.ui.input({
    prompt = "New File Name: ",
    default = extra,
    completion = "file",
  }, function(new)
    if not new or new == "" or new == extra then
      return
    end
    new = vim.fs.normalize(root .. "/" .. new)
    vim.fn.mkdir(vim.fs.dirname(new), "p")
    on_rename_file(old, new, function()
      vim.fn.rename(old, new)
      vim.cmd.edit(new)
      vim.api.nvim_buf_delete(buf, { force = true })
      vim.fn.delete(old)
    end)
  end)
end

vim.api.nvim_set_keymap('n', '<leader>rb', ':call v:lua.rename_file()<CR>',  {noremap = true, silent = true})

vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.hide(nil, nil)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.show(nil, nil)
  end
end

vim.api.nvim_set_keymap('n', '<leader>vv', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})

keymap("n", "<leader>cc", ":lua require('nvim-comment-frame').add_comment()<CR>", opts)
-- vim.keymap.set(
--   "",
--   "<Leader>vt",
--   require("lsp_lines").toggle,
--   { desc = "Toggle lsp_lines" }
-- )

-- local crates = require('crates')

-- vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
-- vim.keymap.set('n', '<leader>cr', crates.reload, opts)
--
-- vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
-- vim.keymap.set('n', '<leader>caf', crates.show_features_popup, opts)
-- vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

vim.keymap.set("n", "M", show_documentation, { noremap = true, silent = true })

-- vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
-- vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
-- vim.keymap.set('n', '<leader>ca', crates.update_all_crates, opts)
-- vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
-- vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
-- vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)
--
-- vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts)
-- vim.keymap.set('n', '<leader>cR', crates.open_repository, opts)
-- vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts)
-- vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts)

keymap("n", "<C-Space>", "<cmd>WhichKey \\<cr>", opts)

vim.cmd([[
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey20
]])

-- vim.cmd([[
--     let g:coq_settings = { 'auto_start': v:true }
-- ]])
--
----------------------------------------------------------------------
--                             LSP keys                             --
----------------------------------------------------------------------


keymap( "n", "gy", ":Trouble lsp_type_definitions<CR>", opts)
keymap( "n", "gi", ":Trouble lsp_implementations<CR>", opts)
keymap( "n", "gr", ":Trouble lsp_references<CR>", opts)
keymap( "n", "gd", ":Trouble lsp_definitions<CR>", opts)
-- keymap( "n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap( "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap( "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap( "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap( "n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap( "v", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap( "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap( "n", "<leader>ra", "<cmd>Format<CR>", opts)
keymap( "n", "<leader>,", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap( "n", "<leader>.", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap( "n", "<leader>qq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap( "n", "<leader>qw", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
-- keymap( "n", "<leader>qw", ":Trouble diagnostics toggle<cr>", opts)

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

-- local range_formatting = function()
--     local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
--     local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
--     vim.lsp.buf.format({
--         range = {
--             ["start"] = { start_row, 0 },
--             ["end"] = { end_row, 0 },
--         },
--         async = true,
--     })
-- end
--
-- vim.keymap.set("v", "<leader>fa", range_formatting, { desc = "Range Formatting" })
