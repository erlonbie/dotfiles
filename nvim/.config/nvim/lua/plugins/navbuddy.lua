local M = {
  "SmiteshP/nvim-navbuddy",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local navbuddy = require "nvim-navbuddy"
  -- local actions = require("nvim-navbuddy.actions")
  navbuddy.setup {
    window = {
      border = "rounded",
      size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
      -- position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
      position = {row = "0%", col = "100%"},   -- Or table format example: { row = "100%", col = "0%"}
    },
    sections = {
      left = {
        size = "20%",
        border = "rounded",         -- You can set border style for each section individually as well.
      },
      mid = {
        size = "40%",
        border = "rounded",
      },
      right = {
        -- No size option for right most section. It fills to
        -- remaining area.
        border = nil,
        preview = "leaf",         -- Right section can show previews too.
        -- Options: "leaf", "always" or "never"
      }
    },
    icons = require("user.icons").kind,
    lsp = { auto_attach = true },
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
  keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
end

return M
