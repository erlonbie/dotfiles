-- local M = {
-- 	"rmagatti/auto-session",
-- }
--
-- function M.config()
-- 	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
--
-- 	require("auto-session").setup({
-- 		-- log_level = vim.log.levels.ERROR,
-- 		auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
-- 		auto_session_use_git_branch = false,
-- 		auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
-- 		auto_session_enable_last_session = false,
-- 		bypass_session_save_file_types = { "alpha" },
-- 		enabled = true, -- Enables/disables auto creating, saving and restoring
-- 		root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Root dir where sessions will be stored
-- 		auto_save = true, -- Enables/disables auto saving session on exit
-- 		auto_restore = true, -- Enables/disables auto restoring session on start
-- 		auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
-- 		suppressed_dirs = nil, -- Suppress session restore/create in certain directories
-- 		allowed_dirs = nil, -- Allow session restore/create in certain directories
-- 		auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
-- 		use_git_branch = false, -- Include git branch name in session name
-- 		lazy_support = true, -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used. Can be disabled if a problem is suspected or for debugging
-- 		bypass_save_filetypes = nil, -- List of file types to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
-- 		close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
-- 		args_allow_single_directory = true, -- Follow normal sesion save/load logic if launched with a single directory as the only argument
-- 		args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
-- 		continue_restore_on_error = true, -- Keep loading the session even if there's an error
-- 		cwd_change_handling = false, -- Follow cwd changes, saving a session before change and restoring after
-- 		log_level = "error", -- Sets the log level of the plugin (debug, info, warn, error).
-- 		session_lens = {
-- 			load_on_setup = true, -- Initialize on startup (requires Telescope)
-- 			theme_conf = { -- Pass through for Telescope theme options
-- 				layout_config = { -- As one example, can change width/height of picker
-- 					width = 0.5, -- percent of window
-- 					height = 0.5,
-- 				},
-- 			},
-- 			previewer = false, -- File preview for session picker
--
-- 			mappings = {
-- 				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
-- 				delete_session = { "i", "<C-D>" },
-- 				alternate_session = { "i", "<C-S>" },
-- 			},
--
-- 			session_control = {
-- 				control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
-- 				control_filename = "session_control.json", -- File name of the session control file
-- 			},
-- 		},
-- 	})
-- end
--
-- return M


local M = {
  "rmagatti/auto-session",
}

function M.config()
  vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  -- local opts = {
  --   auto_session_enabled = true,
  --   auto_save_enabled = nil,
  --   auto_restore_enabled = nil,
  --   auto_session_suppress_dirs = {
  --     -- vim.fn.glob(vim.fn.stdpath "config" .. "/*"),
  --     os.getenv "HOME",
  --     -- os.getenv "HOME" .. "/Machfiles",
  --   },
  --   auto_session_use_git_branch = nil,
  --   -- the configs below are lua only
  --   bypass_session_save_file_types = { "alpha" },
  -- }
  --
  -- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
  --
  -- -- telescope.load_extension "session-lens"
  --
  -- session_lens.setup {
  --   path_display = { "shorten" },
  --   -- theme_conf = { border = false },
  --   previewer = false,
  --   prompt_title = "Sessions",
  -- }
  --
  -- auto_session.setup(opts)
  require("auto-session").setup {
    log_level = vim.log.levels.ERROR,
    auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    auto_session_use_git_branch = false,
    auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
    auto_session_enable_last_session = false,
    bypass_session_save_file_types = { "alpha" },

    -- ⚠️ This will only work if Telescope.nvim is installed
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    session_lens = {
      -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
      load_on_setup = true,
      theme_conf = { border = true },
      previewer = false,
    },
  }

  -- Set mapping for searching a session.
  -- ⚠️ This will only work if Telescope.nvim is installed
  -- vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
  --   noremap = true,
  -- })
end

return M
