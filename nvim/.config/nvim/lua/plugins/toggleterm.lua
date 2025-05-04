-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
-- 	-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<c-h>", [[<C-\><C-n><C-W>h]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<c-j>", [[<C-\><C-n><C-W>j]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<c-k>", [[<C-\><C-n><C-W>k]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<c-l>", [[<C-\><C-n><C-W>l]], opts)
-- end
--
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
--
-- -- local Terminal = require("toggleterm.terminal").Terminal
-- -- local lazygit = Terminal:new {
-- --   cmd = "lazygit",
-- --   hidden = true,
-- --   direction = "float",
-- --   on_open = function(_)
-- --     vim.cmd "startinsert!"
-- --     vim.cmd "set laststatus=0"
-- --   end,
-- --   on_close = function(_)
-- --     vim.cmd "set laststatus=3"
-- --   end,
-- --   count = 99,
-- -- }
--
-- local M = {
-- 	"akinsho/toggleterm.nvim",
--   event = "VeryLazy",
-- 	enabled = true,
-- 	lazy = true,
-- }
--
-- function M.config()
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({
-- 	cmd = "lazygit",
-- 	hidden = true,
-- 	direction = "float",
-- 	float_opts = {
-- 		border = "curved",
-- 		-- width = 100000,
-- 		-- height = 100000,
-- 	},
-- 	on_open = function(_)
-- 		vim.cmd("startinsert!")
-- 		-- vim.cmd "set laststatus=0" end,
-- 	on_close = function(_)
-- 		-- vim.cmd "set laststatus=3"
-- 	end,
-- 	count = 99,
-- })
--
-- function _LAZYGIT_TOGGLE()
-- 	lazygit:toggle()
-- end
--
-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end
--
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end
--
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
--
-- function _HTOP_TOGGLE()
-- 	htop:toggle()
-- end
--
-- local python = Terminal:new({ cmd = "python", hidden = true })
--
-- function _PYTHON_TOGGLE()
-- 	python:toggle()
-- end
--
-- local cargo_run = Terminal:new({ cmd = "cargo run", hidden = true })
--
-- function _CARGO_RUN()
-- 	cargo_run:toggle()
-- end
--
-- local cargo_test = Terminal:new({ cmd = "cargo test", hidden = true })
--
-- function _CARGO_TEST()
-- 	cargo_test:toggle()
-- end
--
-- local float_term = Terminal:new({
-- 	direction = "float",
-- 	on_open = function(term)
-- 		vim.cmd("startinsert!")
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"n",
-- 			"<m-1>",
-- 			"<cmd>1ToggleTerm direction=float<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"t",
-- 			"<m-1>",
-- 			"<cmd>1ToggleTerm direction=float<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"i",
-- 			"<m-1>",
-- 			"<cmd>1ToggleTerm direction=float<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-2>", "<nop>", { noremap = true, silent = true })
-- 		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
-- 	end,
-- 	count = 1,
-- })
--
-- function _FLOAT_TERM()
-- 	float_term:toggle()
-- end
--
-- vim.api.nvim_set_keymap("n", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })
--
-- local vertical_term = Terminal:new({
-- 	direction = "vertical",
-- 	on_open = function(term)
-- 		vim.cmd("startinsert!")
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"n",
-- 			"<m-2>",
-- 			"<cmd>2ToggleTerm size=60 direction=vertical<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"t",
-- 			"<m-2>",
-- 			"<cmd>2ToggleTerm size=60 direction=vertical<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"i",
-- 			"<m-2>",
-- 			"<cmd>2ToggleTerm size=60 direction=vertical<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
-- 	end,
-- 	count = 2,
-- })
--
-- function _VERTICAL_TERM()
-- 	vertical_term:toggle(60)
-- end
--
-- vim.api.nvim_set_keymap("n", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
--
-- local horizontal_term = Terminal:new({
-- 	direction = "horizontal",
-- 	on_open = function(term)
-- 		vim.cmd("startinsert!")
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"n",
-- 			"<m-3>",
-- 			"<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"t",
-- 			"<m-3>",
-- 			"<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(
-- 			term.bufnr,
-- 			"i",
-- 			"<m-3>",
-- 			"<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
-- 			{ noremap = true, silent = true }
-- 		)
-- 		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-2>", "<nop>", { noremap = true, silent = true })
-- 	end,
-- 	count = 3,
-- })
--
-- function _HORIZONTAL_TERM()
-- 	horizontal_term:toggle(10)
-- end
--
-- vim.api.nvim_set_keymap("n", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
--
-- return {
-- 	"akinsho/toggleterm.nvim",
--   enabled = true,
-- 	opts = {
-- 		size = 60,
-- 		open_mapping = [[<m-0>]],
-- 		hide_numbers = true,
-- 		shade_filetypes = {},
-- 		shade_terminals = true,
-- 		shading_factor = 2,
-- 		start_in_insert = true,
-- 		insert_mappings = true,
-- 		persist_size = true,
-- 		direction = "vertical",
-- 		close_on_exit = true,
-- 		shell = vim.o.shell,
-- 		float_opts = {
-- 			border = "curved",
-- 			winblend = 0,
-- 			highlights = {
-- 				border = "normal",
-- 				background = "Normal",
-- 			},
-- 		},
-- 	},
-- }
-- end
--
-- return M


local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

function M.config()
  local execs = {
    { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
    { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
    { nil, "<M-3>", "Float Terminal", "float", nil },
  }

  local function get_buf_size()
    local cbuf = vim.api.nvim_get_current_buf()
    local bufinfo = vim.tbl_filter(function(buf)
      return buf.bufnr == cbuf
    end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
    if bufinfo == nil then
      return { width = -1, height = -1 }
    end
    return { width = bufinfo.width, height = bufinfo.height }
  end

  local function get_dynamic_terminal_size(direction, size)
    size = size
    if direction ~= "float" and tostring(size):find(".", 1, true) then
      size = math.min(size, 1.0)
      local buf_sizes = get_buf_size()
      local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
      return buf_size * size
    else
      return size
    end
  end

  local exec_toggle = function(opts)
    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new { cmd = opts.cmd, count = opts.count, direction = opts.direction }
    term:toggle(opts.size, opts.direction)
  end

  local add_exec = function(opts)
    local binary = opts.cmd:match "(%S+)"
    if vim.fn.executable(binary) ~= 1 then
      vim.notify("Skipping configuring executable " .. binary .. ". Please make sure it is installed properly.")
      return
    end

    vim.keymap.set({ "n", "t" }, opts.keymap, function()
      exec_toggle { cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size() }
    end, { desc = opts.label, noremap = true, silent = true })
  end

  for i, exec in pairs(execs) do
    local direction = exec[4]

    local opts = {
      cmd = exec[1] or vim.o.shell,
      keymap = exec[2],
      label = exec[3],
      count = i + 100,
      direction = direction,
      size = function()
        return get_dynamic_terminal_size(direction, exec[5])
      end,
    }

    add_exec(opts)
  end

  require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = false,
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = nil, -- change the default shell
    float_opts = {
      border = "rounded",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.count
      end,
    },
  }
  vim.cmd [[
  augroup terminal_setup | au!
  autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
  autocmd TermEnter * startinsert!
  augroup end
  ]]

  vim.api.nvim_create_autocmd({ "TermEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.cmd "startinsert"
      _G.set_terminal_keymaps()
    end,
  })

  local opts = { noremap = true, silent = true }
  function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
  end

  -- abstract to function
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd "startinsert!"
    end,
  }

  local bun_outdated = Terminal:new {
    cmd = "bunx npm-check-updates@latest -ui --format group --packageManager bun",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd "startinsert!"
    end,
  }

  local cargo_run = Terminal:new {
    cmd = "cargo run -q",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd "startinsert!"
    end,
  }

  local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

  function _NCDU_TOGGLE()
    ncdu:toggle()
  end

  local htop = Terminal:new({ cmd = "htop", hidden = true })

  function _HTOP_TOGGLE()
    htop:toggle()
  end

  local python = Terminal:new({ cmd = "python", hidden = true })

  function _PYTHON_TOGGLE()
    python:toggle()
  end

  local cargo_run = Terminal:new({ cmd = "cargo run", hidden = true })

  function _CARGO_RUN()
    cargo_run:toggle()
  end

  local cargo_test = Terminal:new({ cmd = "cargo test", hidden = true })

  function _CARGO_TEST()
    cargo_test:toggle()
  end

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end

  function _BUN_OUTDATED()
    bun_outdated:toggle()
  end

  -- vim.api.nvim_set_keymap("n", "<leader>gz", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>lua _bun_outdated()<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "<leader>cr", "<cmd>lua _cargo_run()<CR>", { noremap = true, silent = true })
end

return M
