local M = {
  "nvim-neotest/neotest",
	enabled = true,
	event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/nvim-nio",
    -- language specific tests
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
		"rcasia/neotest-java",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
		"folke/which-key.nvim",
    -- "lawrence-laz/neotest-zig",
    -- "rcasia/neotest-bash",
  },
}

function M.config()
  -- local wk = require "which-key"
  -- wk.register {
  --   ["<leader>tt"] = { "<cmd>lua require'neotest'.run.run()<cr>", "Test Nearest" },
  --   ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
  --   ["<leader>td"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Test" },
  --   ["<leader>ts"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Test Stop" },
  --   ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach Test" },
  -- }

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require ("neotest-rust") {args = {"--no-capture"}},
      -- require "neotest-java",
      require "neotest-vitest",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
  }
end

return M

-- return {
--   "nvim-neotest/neotest",
--   dependencies = {
--     "nvim-neotest/nvim-nio",
--     "nvim-lua/plenary.nvim",
--     "antoinemadec/FixCursorHold.nvim",
--     "nvim-treesitter/nvim-treesitter",
--     "nvim-neotest/neotest-python",
--     "rouge8/neotest-rust",
--     "rcasia/neotest-java",
--   },
--   config = function()
--     require("neotest").setup({
--       adapters = {
--         require("neotest-python")({}),
--         require "neotest-rust",
--         require "neotest-java",
--       },
--     })
--   end,
-- }
