return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "mrbjarksen/neo-tree-diagnostics.nvim" },
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	enabled = true,
	lazy = true,
  event = "VeryLazy",
	branch = "v3.x",
	cmd = "Neotree",
	keys = {
		{
			"<leader>fe",
			function()
				-- require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (root dir)",
		},
		{
			"<leader>fE",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{ "<C-n>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
		-- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	opts = {
		default = true,
		sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		-- open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
		open_files_do_not_replace_types = { "terminal"},
		filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = true,
                hide_gitignored = true
            },

			group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
      scan_mode = "deep",
			group_empty_dirs = true, -- when true, empty directories will be grouped together
			bind_to_cwd = true,
			follow_current_file = { enabled = true},
			use_libuv_file_watcher = true,
      hijack_netrw_behavior = "open_default",
			auto_expand_width = true
		},
		window = {
			position = "left",
			width = 35,
			mappings = {
				["<space>"] = {
					"toggle_node",
					nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
				},
				["<2-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["<esc>"] = "cancel", -- close preview or floating neo-tree window
				-- ["P"] = { "toggle_preview", config = { use_float = true } },
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				["l"] = "open",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				-- ["S"] = "split_with_window_picker",
				-- ["s"] = "vsplit_with_window_picker",
				["t"] = "open_tabnew",
				-- ["<cr>"] = "open_drop",
				-- ["t"] = "open_tab_drop",
				["w"] = "open_with_window_picker",
				--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
				["h"] = "close_node",
				-- ['C'] = 'close_all_subnodes',
				["z"] = "close_all_nodes",
				--["Z"] = "expand_all_nodes",
				["a"] = {
					"add",
					-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
					-- some commands may take optional config options, see `:h neo-tree-mappings` for details
					config = {
						show_path = "relative", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				["d"] = "delete",
				["r"] = "rename",
				-- ["H"] = "navigate_up",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
				-- ["c"] = {
				--  "copy",
				--  config = {
				--    show_path = "none" -- "none", "relative", "absolute"
				--  }
				--}
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				[">"] = "prev_source",
				["<"] = "next_source",
				["i"] = "show_file_details",
                ["D"] = "show_diff",
			},
			fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
				["<down>"] = "move_cursor_down",
				["<C-j>"] = "move_cursor_down",
				["<up>"] = "move_cursor_up",
				["<C-k>"] = "move_cursor_up",
			},
		},
        commands = {
            show_diff = function (state)
                -- some variables. use any if you want
                local node = state.tree:get_node()
                -- local abs_path = node.path
                -- local rel_path = vim.fn.fnamemodify(abs_path, ":~:.")
                -- local file_name = node.name
                local is_file = node.type == "file"
                if not is_file then
                    vim.notify("Diff only for files", vim.log.levels.ERROR)
                    return
                end
                -- open file
                local cc = require("neo-tree.sources.common.commands")
                cc.open(state, function()
                    -- do nothing for dirs
                end)

                -- I recommend using one of below to show the diffs

                -- Raw vim
                -- git show ...: change arg as you want
                -- @: current file vs git head
                -- @^: current file vs previous commit
                -- @^^^^: current file vs 4 commits before head and so on...
                vim.cmd([[
      !git show @^:% > /tmp/%
      vert diffs /tmp/%
      ]])

                -- Fugitive
                vim.cmd([[Gdiffsplit]])  -- or
                vim.cmd([[Ghdiffsplit]]) -- or
                vim.cmd([[Gvdiffsplit]])

                -- diffview.nvim
                vim.cmd([[DiffviewOpen -- %]])
            end,
        },
		default_component_configs = {
			indent = {
        indent_size = 1,
        padding = 0, -- extra padding on left hand side
				with_expanders = false, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "", -- this can only be used in the git_status source
					renamed = "󰁕", -- this can only be used in the git_status source
					-- Status type
					untracked = "★",
					ignored = "◌",
					unstaged = "✗",
					staged = "✓",
					conflict = "",
				},
			},
			renderers = {
				directory = {
					{ "indent" },
					{ "icon", use_git_status_color = true },
					{ "current_filter" },
					{ "diagnostics", errors_only = true, hide_when_expanded = true },
					{ "git_status", hide_when_expanded = true },
					{ "name" },
					{ "clipboard" },
				},
				file = {
					{ "indent" },
					{ "icon" },
					{ "diagnostics" },
					{ "git_status" },
					{ "name" },
					{ "clipboard" },
					{ "modified" },
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
			},
		},
		diagnostics = {
			auto_preview = { -- May also be set to `true` or `false`
				enabled = false, -- Whether to automatically enable preview mode
				preview_config = {}, -- Config table to pass to auto preview (for example `{ use_float = true }`)
				event = "neo_tree_buffer_enter", -- The event to enable auto preview upon (for example `"neo_tree_window_after_open"`)
			},
			bind_to_cwd = true,
			diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
			-- "position" means diagnostic items are sorted strictly by their positions.
			-- May also be a function.
			follow_current_file = { -- May also be set to `true` or `false`
				enabled = true, -- This will find and focus the file in the active buffer every time
				always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file
				expand_followed = true, -- Ensure the node of the followed file is expanded
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				leave_files_open = false, -- `false` closes auto expanded files, such as with `:Neotree reveal`
			},
			show_unloaded = true, -- show diagnostics from unloaded buffers
			refresh = {
				delay = 100, -- Time (in ms) to wait before updating diagnostics. Might resolve some issues with Neovim hanging.
				event = "vim_diagnostic_changed", -- Event to use for updating diagnostics (for example `"neo_tree_buffer_enter"`)
				-- Set to `false` or `"none"` to disable automatic refreshing
				max_items = 10000, -- The maximum number of diagnostic items to attempt processing
				-- Set to `false` for no maximum
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})
	end,
}
