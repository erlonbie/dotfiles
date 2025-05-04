local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  lazy = true,
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}

function M.config() end

return M
