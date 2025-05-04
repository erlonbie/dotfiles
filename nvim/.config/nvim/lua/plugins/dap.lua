-- local M = {
--   "mfussenegger/nvim-dap",
--   event = "VeryLazy",
--   lazy = true,
--   cmd = {
--     "DapContinue",
--   },
--   dependencies = {
--     {
--       "rcarriga/nvim-dap-ui",
--       "mfussenegger/nvim-dap-python",
--       "theHamsta/nvim-dap-virtual-text",
--       "nvim-telescope/telescope-dap.nvim",
-- 			"Pocco81/DAPInstall.nvim",
-- 			"mxsdev/nvim-dap-vscode-js",
-- 			"leoluz/nvim-dap-go",
-- 			{
-- 				"microsoft/vscode-js-debug",
-- 			-- 	-- After install, build it and rename the dist directory to out
-- 				build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
-- 			-- 	version = "1.*",
-- 			},
--     },
--   },
-- }
--
-- function M.config()
-- local dap_status_ok, dap = pcall(require, "dap")
-- if not dap_status_ok then
-- 	return
-- end
--
-- local dap_ui_status_ok, dapui = pcall(require, "dapui")
-- if not dap_ui_status_ok then
-- 	return
-- end
--
-- local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
-- if not dap_virtual_text_status_ok then
-- 	return
-- end
--
-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
--
-- -- dapui.setup()
-- dapui.setup({
-- 	icons = { expanded = "▾", collapsed = "▸" },
-- 	mappings = {
-- 		-- Use a table to apply multiple mappings
-- 		expand = { "<CR>", "<2-LeftMouse>" },
-- 		open = "o",
-- 		remove = "d",
-- 		edit = "e",
-- 		repl = "r",
-- 		toggle = "t",
-- 	},
-- 	-- Expand lines larger than the window
-- 	-- Requires >= 0.7
-- 	-- expand_lines = vim.fn.has("nvim-0.7"),
-- 	-- Layouts define sections of the screen to place windows.
-- 	-- The position can be "left", "right", "top" or "bottom".
-- 	-- The size specifies the height/width depending on position. It can be an Int
-- 	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
-- 	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
-- 	-- Elements are the elements shown in the layout (in order).
-- 	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				-- Elements can be strings or table with id and size keys.
-- 				{ id = "scopes", size = 0.25 },
-- 				"breakpoints",
-- 				"stacks",
-- 				"watches",
-- 			},
-- 			size = 0.25, -- 40 columns
-- 			position = "left",
-- 		},
-- 		{
-- 			elements = {
-- 				"repl",
-- 				"console",
-- 			},
-- 			size = 0.25, -- 25% of total lines
-- 			position = "bottom",
-- 		},
-- 	},
-- 	controls = {
-- 		-- Requires Neovim nightly (or 0.8 when released)
-- 		enabled = true,
-- 		-- Display controls in this element
-- 		element = "repl",
-- 		icons = {
-- 			pause = "",
-- 			play = "",
-- 			step_over = "",
--       step_into = "",
-- 			step_out = "",
-- 			step_back = "",
-- 			run_last = "↻",
-- 			terminate = "□",
-- 		},
-- 	},
-- 	floating = {
-- 		max_height = 0.5, -- These can be integers or a float between 0 and 1.
-- 		max_width = 0.9, -- Floats will be treated as percentage of your screen.
-- 		border = "double", -- Border style. Can be "single", "double" or "rounded"
-- 		mappings = {
-- 			close = { "q", "<Esc>" },
-- 		},
-- 	},
-- 	windows = { indent = 1 },
-- 	render = {
-- 		max_type_length = nil, -- Can be integer or nil.
-- 	},
-- })
--
-- local icons = require("user.icons")
--
-- keymap("n", "<F3>", ":DapTerminate<CR>", opts)
-- keymap("n", "<F5>", ":DapContinue<CR>", opts)
-- keymap("n", "<F10>", ":DapToggleBreakpoint<CR>", opts)
-- keymap("n", "<F9>", ":DapStepInto<CR>", opts)
-- keymap("n", "<F8>", ":DapStepOver<CR>", opts)
-- keymap("n", "<C-y>", "<cmd>lua require('dapui').eval()<cr>", opts)
--
--
-- dap_virtual_text.setup {
--     enabled = true,                        -- enable this plugin (the default)
--     enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
--     highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
--     highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
--     show_stop_reason = true,               -- show stop reason when stopped for exceptions
--     commented = false,                     -- prefix virtual text with comment string
--     only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
--     all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
--     clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
--     --- A callback that determines how a variable is displayed or whether it should be omitted
--     --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
--     --- @param buf number
--     --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
--     --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
--     --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
--     --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
--     display_callback = function(variable, buf, stackframe, node, options)
--       if options.virt_text_pos == 'inline' then
--         return ' = ' .. variable.value
--       else
--         return variable.name .. ' = ' .. variable.value
--       end
--     end,
--     -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
--     virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
--
--     -- experimental features:
--     all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
--     virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
--     virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
--                                            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
-- }
--
-- ----------------------------------------------------------------------
-- --                               cpp                                --
-- ----------------------------------------------------------------------
--
-- dap.adapters.lldb = {
-- 	type = "executable",
-- 	command = "/usr/bin/lldb-vscode", -- adjust as needed
-- 	name = "lldb",
-- }
-- -- C, C++, Rust
-- dap.adapters.codelldb = {
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		command = "codelldb",
-- 		args = { "--port", "${port}" },
-- 	},
-- }
--
-- dap.configurations.cpp = {
-- 	-- If you get an "Operation not permitted" error using this, try disabling YAMA:
-- 	--  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
-- 	{
-- 		name = "Launch",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 		args = {},
-- 		runInTerminal = false,
-- 	},
-- 	{
-- 		name = "Attach",
-- 		type = "codelldb",
-- 		request = "attach",
-- 		pid = require("dap.utils").pick_process,
-- 		args = {},
-- 		runInTerminal = false,
-- 	},
-- }
--
-- -- If you want to use this for rust and c, add something like this:
--
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp
--
--
-- -- local status_ok, rt = pcall(require, "rust-tools")
-- -- if not status_ok then
-- -- 	return
-- -- end
--
-- -- local mason_registry = require("mason-registry")
-- --
-- -- local codelldb = mason_registry.get_package("codelldb")
-- -- local extension_path = codelldb:get_install_path() .. "/extension/"
-- -- local codelldb_path = extension_path .. "adapter/codelldb"
-- -- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
--
-- -- rt.setup({
-- -- 	dap = {
-- -- 		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
-- -- 	},
-- -- })
--
-- ----------------------------------------------------------------------
-- --                              Python                              --
-- ----------------------------------------------------------------------
--
-- -- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")
-- -- require("dap-python").setup("python3")
-- require("dap-python").test_runner = 'pytest'
--
-- -- table.insert(dap.configurations.python, {
-- --     type = 'python';
-- --     request = 'attach';
-- --     name = 'Attach to Docker';
-- --     host = function()
-- --         local value = vim.fn.input('Host [127.0.0.1]: ')
-- --         if value ~= "" then
-- --             return value
-- --         end
-- --         return '127.0.0.1'
-- --     end;
-- --     port = function()
-- --         return tonumber(vim.fn.input('Port [5678]: ')) or 5678
-- --     end;
-- --     pathMappings = {{
-- --         localRoot = function()
-- --             local value = vim.fn.input('/home/erlonbie/Jusbrasil')
-- --             if value ~= "" then
-- --                 return value
-- --             end
-- --             return vim.fn.getcwd()
-- --         end;
-- --         remoteRoot = function()
-- --             local value = vim.fn.input('/home/digesto/Workspace/worker_2a')
-- --             if value ~= "" then
-- --                 return value
-- --             end
-- --             return "/"
-- --         end;
-- --     }}
--
-- -- require("dap-python").setup("/usr/local/share/miniconda3/bin/python")
-- table.insert(require("dap").configurations.python, {
-- 	type = "python",
-- 	request = "attach",
-- 	name = "Remote Python: Attach",
-- 	port = 5678,
-- 	host = "127.0.0.1",
-- 	mode = "remote",
-- 	cwd = vim.fn.getcwd(),
-- 	pathMappings = {
-- 		{
-- 			localRoot = function()
-- 				return vim.fn.input("Local code folder > ", "/home/erlonbie/Jusbrasil/worker_2a", "file")
-- 			end,
-- 			remoteRoot = function()
-- 				return vim.fn.input("Container code folder > ", "/home/digesto/Workspace/worker_2a", "file")
-- 			end,
-- 		},
-- 	},
-- })
--
-- 	-- local opts = { noremap = true, silent = true }
-- keymap("n", "<leader>tm", ":lua require('dap-python').test_method()<CR>", opts)
-- keymap("n", "<leader>tc", ":lua require('dap-python').test_class()<CR>", opts)
-- keymap("n", "<leader>ds", ":lua require('dap-python').debug_selection()<CR>", opts)
--
-- -- Magma/Jupyter
-- -- keymap("n", "<leader>mi", "<cmd>MagmaInit<cr>", opts)
-- -- keymap("n", "<leader>me", "<cmd>MagmaEvaluateLine<cr>", opts)
-- -- keymap("v", "<leader>mv", "<esc><cmd>MagmaEvaluateVisual<cr>", opts)
-- -- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
-- -- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
-- -- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
--
-- ----------------------------------------------------------------------
-- --                            typescript                            --
-- ----------------------------------------------------------------------
--
-- -- dap.configurations.typescript = {
-- -- 	-- {
-- -- 	-- 	type = "node2",
-- -- 	-- 	name = "node attach",
-- -- 	-- 	request = "attach",
-- -- 	-- 	program = "${file}",
-- -- 	-- 	cwd = vim.fn.getcwd(),
-- -- 	-- 	sourceMaps = true,
-- -- 	-- 	protocol = "inspector",
-- -- 	-- },
-- -- 	-- {
-- -- 	-- 	type = "chrome",
-- -- 	-- 	name = "chrome",
-- -- 	-- 	request = "attach",
-- -- 	-- 	program = "${file}",
-- -- 	-- 	-- cwd = "${workspaceFolder}",
-- -- 	-- 	-- protocol = "inspector",
-- -- 	-- 	port = 9222,
-- -- 	-- 	webRoot = "${workspaceFolder}",
-- -- 	-- 	-- sourceMaps = true,
-- -- 	-- 	sourceMapPathOverrides = {
-- -- 	-- 		-- Sourcemap override for nextjs
-- -- 	-- 		["webpack://_N_E/./*"] = "${webRoot}/*",
-- -- 	-- 		["webpack:///./*"] = "${webRoot}/*",
-- -- 	-- 	},
-- -- 	-- },
-- -- 	-- {
-- -- 	-- 	name = "Debug with Firefox",
-- -- 	-- 	type = "firefox",
-- -- 	-- 	request = "launch",
-- -- 	-- 	reAttach = true,
-- -- 	-- 	sourceMaps = true,
-- -- 	-- 	url = "http://localhost:6969",
-- -- 	-- 	webRoot = "${workspaceFolder}",
-- -- 	-- 	-- NOTE: add a firefoxt path if used <02-01-2024, erlonbie> 
-- -- 	-- 	firefoxExecutable = firefoxExecutable,
-- -- 	-- },
-- -- 		{
-- -- 			type = "pwa-node",
-- -- 			request = "launch",
-- -- 			name = "Launch file",
-- -- 			program = "${file}",
-- -- 			cwd = "${workspaceFolder}",
-- -- 		},
-- -- 		{
-- -- 			type = "pwa-node",
-- -- 			request = "attach",
-- -- 			name = "Attach",
-- -- 			processId = require 'dap.utils'.pick_process,
-- -- 			cwd = "${workspaceFolder}",
-- -- 		},
-- -- 		{
-- -- 			type = "pwa-chrome",
-- -- 			request = "launch",
-- -- 			name = "Start Chrome with \"localhost\"",
-- -- 			url = "http://localhost:3000",
-- -- 			webRoot = "${workspaceFolder}",
-- -- 			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
-- -- 		}
-- -- }
-- --
-- -- dap.configurations.typescriptreact = dap.configurations.typescript
-- -- dap.configurations.javascript = dap.configurations.typescript
-- -- dap.configurations.javascriptreact = dap.configurations.typescript
-- 	require("dap-vscode-js").setup({
-- 		-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
-- 		-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
-- 		debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
-- 		-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
-- 		adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
-- 		-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
-- 		-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
-- 		-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- 	})
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
--   require("dap").configurations[language] = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
--   {
--     type = "pwa-node",
--     request = "attach",
--     name = "Attach",
--     processId = require'dap.utils'.pick_process,
--     cwd = "${workspaceFolder}",
--   }}
-- end
--
-- ----------------------------------------------------------------------
-- --                               lua                                --
-- ----------------------------------------------------------------------
--
-- dap.configurations.lua = {
-- 	{
-- 		type = "nlua",
-- 		request = "attach",
-- 		name = "Neovim attach",
-- 		host = function()
-- 			local value = vim.fn.input("Host [127.0.0.1]: ")
-- 			if value ~= "" then
-- 				return value
-- 			end
-- 			return "127.0.0.1"
-- 		end,
-- 		port = function()
-- 			local val = tonumber(vim.fn.input("Port: "))
-- 			assert(val, "Please provide a port number")
-- 			return val
-- 		end,
-- 	},
-- }
--
-- ----------------------------------------------------------------------
-- --                                go                                --
-- ----------------------------------------------------------------------
--
-- dap.adapters.delve = function(callback, config)
--     if config.mode == 'remote' and config.request == 'attach' then
--         callback({
--             type = 'server',
--             host = config.host or '127.0.0.1',
--             port = config.port or '38697'
--         })
--     else
--         callback({
--             type = 'server',
--             port = '${port}',
--             executable = {
--                 command = 'dlv',
--                 -- args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
--                 args = { "dap", "-l", "127.0.0.1:${port}" },
--                 detached = vim.fn.has("win32") == 0,
--             }
--         })
--     end
-- end
--
--
-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
--   {
--     type = "delve",
--     name = "Debug",
--     request = "launch",
--     program = "${file}"
--   },
--   {
--     type = "delve",
--     name = "Debug test", -- configuration for debugging test files
--     request = "launch",
--     mode = "test",
--     program = "${file}"
--   },
--   -- works with go.mod packages and sub packages 
--   {
--     type = "delve",
--     name = "Debug test (go.mod)",
--     request = "launch",
--     mode = "test",
--     program = "./${relativeFileDirname}"
--   } 
-- }
--
--
-- -- dap.adapters.go = function(callback, _)
-- -- 	local stdout = vim.loop.new_pipe(false)
-- -- 	local handle
-- -- 	local pid_or_err
-- -- 	local port = 38697
-- -- 	local go_opts = {
-- -- 		stdio = { nil, stdout },
-- -- 		args = { "dap", "-l", "127.0.0.1:" .. port },
-- -- 		detached = true,
-- -- 	}
-- -- 	handle, pid_or_err = vim.loop.spawn("dlv", go_opts, function(code)
-- -- 		stdout:close()
-- -- 		handle:close()
-- -- 		if code ~= 0 then
-- -- 			print("dlv exited with code", code)
-- -- 		end
-- -- 	end)
-- -- 	assert(handle, "Error running dlv: " .. tostring(pid_or_err))
-- -- 	stdout:read_start(function(err, chunk)
-- -- 		assert(not err, err)
-- -- 		if chunk then
-- -- 			vim.schedule(function()
-- -- 				require("dap.repl").append(chunk)
-- -- 			end)
-- -- 		end
-- -- 	end)
-- -- 	-- Wait for delve to start
-- -- 	vim.defer_fn(function()
-- -- 		callback({ type = "server", host = "127.0.0.1", port = port })
-- -- 	end, 100)
-- -- end
-- -- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- -- dap.configurations.go = {
-- -- 	{
-- -- 		type = "go",
-- -- 		name = "Debug",
-- -- 		request = "launch",
-- -- 		program = "${file}",
-- -- 	},
-- -- 	{
-- -- 		type = "go",
-- -- 		name = "Debug test", -- configuration for debugging test files
-- -- 		request = "launch",
-- -- 		mode = "test",
-- -- 		program = "${file}",
-- -- 	},
-- -- 	-- works with go.mod packages and sub packages
-- -- 	{
-- -- 		type = "go",
-- -- 		name = "Debug test (go.mod)",
-- -- 		request = "launch",
-- -- 		mode = "test",
-- -- 		program = "./${relativeFileDirname}",
-- -- 	},
-- -- }
--
-- -- require('dap-go').setup {
-- --   -- Additional dap configurations can be added.
-- --   -- dap_configurations accepts a list of tables where each entry
-- --   -- represents a dap configuration. For more details do:
-- --   -- :help dap-configuration
-- --   dap_configurations = {
-- --     {
-- --       -- Must be "go" or it will be ignored by the plugin
-- --       type = "go",
-- --       name = "Attach remote",
-- --       mode = "remote",
-- --       request = "attach",
-- --     },
-- --   },
-- --   -- delve configurations
-- --   delve = {
-- --     -- the path to the executable dlv which will be used for debugging.
-- --     -- by default, this is the "dlv" executable on your PATH.
-- --     path = "dlv",
-- --     -- time to wait for delve to initialize the debug session.
-- --     -- default to 20 seconds
-- --     initialize_timeout_sec = 20,
-- --     -- a string that defines the port to start delve debugger.
-- --     -- default to string "${port}" which instructs nvim-dap
-- --     -- to start the process in a random available port.
-- --     -- if you set a port in your debug configuration, its value will be
-- --     -- assigned dynamically.
-- --     port = "${port}",
-- --     -- additional args to pass to dlv
-- --     args = {},
-- --     -- the build flags that are passed to delve.
-- --     -- defaults to empty string, but can be used to provide flags
-- --     -- such as "-tags=unit" to make sure the test suite is
-- --     -- compiled during debugging, for example.
-- --     -- passing build flags using args is ineffective, as those are
-- --     -- ignored by delve in dap mode.
-- --     -- avaliable ui interactive function to prompt for arguments get_arguments
-- --     build_flags = {},
-- --     -- whether the dlv process to be created detached or not. there is
-- --     -- an issue on Windows where this needs to be set to false
-- --     -- otherwise the dlv server creation will fail.
-- --     -- avaliable ui interactive function to prompt for build flags: get_build_flags
-- --     detached = vim.fn.has("win32") == 0,
-- --     -- the current working directory to run dlv from, if other than
-- --     -- the current working directory.
-- --     cwd = nil,
-- --   },
-- --   -- options related to running closest test
-- --   tests = {
-- --     -- enables verbosity when running the test.
-- --     verbose = false,
-- --   },
-- -- }
--
-- ----------------------------------------------------------------------
-- --                               dart                               --
-- ----------------------------------------------------------------------
--
-- -- dap.configurations.dart = {
-- -- 	{
-- -- 		type = "dart",
-- -- 		request = "launch",
-- -- 		name = "Launch flutter",
-- -- 		dartSdkPath = sep_os_replacer(join_path(vim.fn.expand("~/"), "/flutter/bin/cache/dart-sdk/")),
-- -- 		flutterSdkPath = sep_os_replacer(join_path(vim.fn.expand("~/"), "/flutter")),
-- -- 		program = sep_os_replacer("${workspaceFolder}/lib/main.dart"),
-- -- 		cwd = "${workspaceFolder}",
-- -- 	},
-- -- }
--
--
-- ----------------------------------------------------------------------
-- --                               PHP                                --
-- ----------------------------------------------------------------------
--
-- dap.adapters.php = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
--   -- args = { "/home/erlonbie/.vscode/extensions/xdebug.php-debug-1.32.0/out/phpDebug.js" }
-- }
--
-- dap.configurations.php = {
--   {
--     type = "php",
-- 		stopOnEntry = true,
--     request = "launch",
--     name = "Listen for Xdebug",
--     port = 9003,
--     pathMappings = {
--       -- ["/var/www/html"] = "${workspaceFolder}"
--       ["/usr/local/src"] = "${workspaceFolder}"
--     }
--   }
-- }
--
-- -- -- local dap_utils = require "user.plugins.configs.dap.utils"
-- -- -- local BASH_DEBUG_ADAPTER_BIN = dap_utils.MASON_BIN_PATH .. "/bash-debug-adapter"
-- -- -- local BASHDB_DIR = dap_utils.MASON_PACKAGE_PATH .. "/bash-debug-adapter/extension/bashdb_dir"
-- -- local BASHDB_DIR = "/home/erlonbie/.local/share/nvim/mason/packages/bash-debug-adapter/extension/bashdb_dir/"
-- --
-- -- dap.adapters.sh = {
-- --   type = "executable",
-- --   command = "/usr/bin/bash",
-- -- }
-- -- dap.configurations.sh = {
-- --   {
-- --     name = "Launch Bash debugger",
-- --     type = "sh",
-- --     request = "launch",
-- --     program = "${file}",
-- --     cwd = "${fileDirname}",
-- --     pathBashdb = BASHDB_DIR .. "/bashdb",
-- --     pathBashdbLib = BASHDB_DIR,
-- --     pathBash = "bash",
-- --     pathCat = "cat",
-- --     pathMkfifo = "mkfifo",
-- --     pathPkill = "pkill",
-- --     env = {},
-- --     args = {},
-- --     -- showDebugOutput = true,
-- --     -- trace = true,
-- --   }
-- -- }
--
-- ----------------------------------------------------------------------
-- --                          end_languages                           --
-- ----------------------------------------------------------------------
--
-- vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
--
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
-- -- dap.listeners.before.event_terminated["dapui_config"] = function()
-- -- 	dapui.close()
-- -- end
-- -- dap.listeners.before.event_exited["dapui_config"] = function()
-- -- 	dapui.close()
-- -- end
-- end
--
-- return M
--
-- -- local js_based_languages = {
-- --   "typescript",
-- --   "javascript",
-- --   "typescriptreact",
-- --   "javascriptreact",
-- --   "vue",
-- -- }
-- --
-- -- return {
-- --   {
-- --     "mfussenegger/nvim-dap",
-- --     config = function()
-- --       local dap = require("dap")
-- --
-- --       local Config = require("lazyvim.config")
-- --       vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
-- --
-- --       for name, sign in pairs(Config.icons.dap) do
-- --         sign = type(sign) == "table" and sign or { sign }
-- --         vim.fn.sign_define(
-- --           "Dap" .. name,
-- --           { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
-- --         )
-- --       end
-- --
-- --       for _, language in ipairs(js_based_languages) do
-- --         dap.configurations[language] = {
-- --           -- Debug single nodejs files
-- --           {
-- --             type = "pwa-node",
-- --             request = "launch",
-- --             name = "Launch file",
-- --             program = "${file}",
-- --             cwd = vim.fn.getcwd(),
-- --             sourceMaps = true,
-- --           },
-- --           -- Debug nodejs processes (make sure to add --inspect when you run the process)
-- --           {
-- --             type = "pwa-node",
-- --             request = "attach",
-- --             name = "Attach",
-- --             processId = require("dap.utils").pick_process,
-- --             cwd = vim.fn.getcwd(),
-- --             sourceMaps = true,
-- --           },
-- --           -- Debug web applications (client side)
-- --           {
-- --             type = "pwa-chrome",
-- --             request = "launch",
-- --             name = "Launch & Debug Chrome",
-- --             url = function()
-- --               local co = coroutine.running()
-- --               return coroutine.create(function()
-- --                 vim.ui.input({
-- --                   prompt = "Enter URL: ",
-- --                   default = "http://localhost:3000",
-- --                 }, function(url)
-- --                   if url == nil or url == "" then
-- --                     return
-- --                   else
-- --                     coroutine.resume(co, url)
-- --                   end
-- --                 end)
-- --               end)
-- --             end,
-- --             webRoot = vim.fn.getcwd(),
-- --             protocol = "inspector",
-- --             sourceMaps = true,
-- --             userDataDir = false,
-- --           },
-- --           -- Divider for the launch.json derived configs
-- --           {
-- --             name = "----- ↓ launch.json configs ↓ -----",
-- --             type = "",
-- --             request = "launch",
-- --           },
-- --         }
-- --       end
-- --     end,
-- --     keys = {
-- --       {
-- --         "<leader>dO",
-- --         function()
-- --           require("dap").step_out()
-- --         end,
-- --         desc = "Step Out",
-- --       },
-- --       {
-- --         "<leader>do",
-- --         function()
-- --           require("dap").step_over()
-- --         end,
-- --         desc = "Step Over",
-- --       },
-- --       {
-- --         "<leader>da",
-- --         function()
-- --           if vim.fn.filereadable(".vscode/launch.json") then
-- --             local dap_vscode = require("dap.ext.vscode")
-- --             dap_vscode.load_launchjs(nil, {
-- --               ["pwa-node"] = js_based_languages,
-- --               ["chrome"] = js_based_languages,
-- --               ["pwa-chrome"] = js_based_languages,
-- --             })
-- --           end
-- --           require("dap").continue()
-- --         end,
-- --         desc = "Run with Args",
-- --       },
-- --     },
-- --     dependencies = {
-- --       -- Install the vscode-js-debug adapter
-- --       {
-- --         "microsoft/vscode-js-debug",
-- --         -- After install, build it and rename the dist directory to out
-- --         build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
-- --         version = "1.*",
-- --       },
-- --       {
-- --         "mxsdev/nvim-dap-vscode-js",
-- --         config = function()
-- --           ---@diagnostic disable-next-line: missing-fields
-- --           require("dap-vscode-js").setup({
-- --             -- Path of node executable. Defaults to $NODE_PATH, and then "node"
-- --             -- node_path = "node",
-- --
-- --             -- Path to vscode-js-debug installation.
-- --             debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
-- --
-- --             -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
-- --             -- debugger_cmd = { "js-debug-adapter" },
-- --
-- --             -- which adapters to register in nvim-dap
-- --             adapters = {
-- --               "chrome",
-- --               "pwa-node",
-- --               "pwa-chrome",
-- --               "pwa-msedge",
-- --               "pwa-extensionHost",
-- --               "node-terminal",
-- --             },
-- --
-- --             -- Path for file logging
-- --             -- log_file_path = "(stdpath cache)/dap_vscode_js.log",
-- --
-- --             -- Logging level for output to file. Set to false to disable logging.
-- --             -- log_file_level = false,
-- --
-- --             -- Logging level for output to console. Set to false to disable console output.
-- --             -- log_console_level = vim.log.levels.ERROR,
-- --           })
-- --         end,
-- --       },
-- --       {
-- --         "Joakker/lua-json5",
-- --         build = "./install.sh",
-- --       },
-- --     },
-- --   },
-- -- }


return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      -- Basic debugging keymaps, feel free to change to your liking!
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      -- { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      { "<C-y>", "<cmd>lua require('dapui').eval()<cr>", desc = "evaluate value"},
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
      unpack(keys),
    }
  end,
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dap_virtual_text = require "nvim-dap-virtual-text"
    local icons = require("user.icons")

----------------------------------------------------------------------
--                               cpp                                --
----------------------------------------------------------------------

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}
-- C, C++, Rust
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.cpp = {
	-- If you get an "Operation not permitted" error using this, try disabling YAMA:
	--  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
	{
		name = "Attach",
		type = "codelldb",
		request = "attach",
		pid = require("dap.utils").pick_process,
		args = {},
		runInTerminal = false,
	},
}

-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

    vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = "",
          play = "",
          step_over = "",
          step_into = "",
          step_out = "",
          step_back = "",
          run_last = "↻",
          -- terminate = "□",
          terminate = '⏹',
          disconnect = '⏏',
        },
        -- icons = {
        --   pause = '⏸',
        --   play = '▶',
        --   step_into = '⏎',
        --   step_over = '⏭',
        --   step_out = '⏮',
        --   step_back = 'b',
        --   run_last = '▶▶',
        --   terminate = '⏹',
        --   disconnect = '⏏',
        -- },
      },
    }

    dap_virtual_text.setup {
      enabled = true,                        -- enable this plugin (the default)
      enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true,               -- show stop reason when stopped for exceptions
      commented = false,                     -- prefix virtual text with comment string
      only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
      all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
      clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
      --- A callback that determines how a variable is displayed or whether it should be omitted
      --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
      --- @param buf number
      --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
      --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
      --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
      --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == 'inline' then
          return ' = ' .. variable.value
        else
          return variable.name .. ' = ' .. variable.value
        end
      end,
      -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
      virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

      -- experimental features:
      all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
      -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
