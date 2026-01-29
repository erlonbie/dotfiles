M = {}
local function contains(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true
    end
  end
  return false
end

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#32363e" })
vim.api.nvim_set_hl(0, "SLTermIcon", { fg = "#b668cd", bg = "#282c34" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#abb2bf", bg = "#32363e", bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D7BA7D", bg = "#252525" })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#abb2bf", bg = "#32363e" })
vim.api.nvim_set_hl(0, "SLFG", { fg = "#abb2bf", bg = "#282c34" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#6b727f", bg = "#181826" })
-- vim.api.nvim_set_hl(0, "SLLSP", { fg = "#abb2bf", bg = sl_hl.background })
vim.api.nvim_set_hl(0, "SLLSP", { fg = "#D3CEAB", bg = "#282c34" })
-- vim.api.nvim_set_hl(0, "SLLSP", { fg = "#5e81ac", bg = "#282c34" })
vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644", bg = "#282c34" })

local hide_in_width = function()
  return vim.o.columns > 80
end

local icons = require "user.icons"

local lanuage_server = {
  function()
    local buf_ft = vim.bo.filetype
    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "",
    }

    if contains(ui_filetypes, buf_ft) then
      return M.language_servers
    end

    local clients = vim.lsp.get_clients()
    local client_names = {}
    local copilot_active = false
    -- local buf_client_names = {}

    -- add client
    for _, client in pairs(clients) do
      if client.name ~= "copilot" and client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
      if client.name == "copilot" then
        copilot_active = true
      end
    end

    -- local lint_s, lint = pcall(require, "lint")
    -- if lint_s then
    --   for ft_k, ft_v in pairs(lint.linters_by_ft) do
    --     if type(ft_v) == "table" then
    --       for _, linter in ipairs(ft_v) do
    --         if buf_ft == ft_k then
    --           table.insert(client_names, linter)
    --         end
    --       end
    --     elseif type(ft_v) == "string" then
    --       if buf_ft == ft_k then
    --         table.insert(client_names, ft_v)
    --       end
    --     end
    --   end
    -- end

    local ok, conform = pcall(require, "conform")
    local formatters = table.concat(conform.formatters_by_ft[vim.bo.filetype], " ")
    if ok then
      for formatter in formatters:gmatch "[%w_-]+" do
        if formatter then
          table.insert(client_names, formatter)
        end
      end
    end

    local hash = {}
    local unique_client_names = {}

    for _, v in ipairs(client_names) do
      if not hash[v] then
        unique_client_names[#unique_client_names + 1] = v
        hash[v] = true
      end
    end

    -- check if unique_client_names has 'copilot' in it and if so, change it to "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*" , maintaning the rest of the list
    if unique_client_names[1] == "copilot" then
      table.remove(unique_client_names, 1)
      table.insert(unique_client_names, 1, "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*")
    end

    local client_names_str = table.concat(client_names, ", ")

    -- check client_names_str if empty
    local language_servers = ""
    local client_names_str_len = #client_names_str
    if client_names_str_len ~= 0 then
      language_servers = "%#SLLSP#" .. "[" .. client_names_str .. "]" .. "%*"
    end
    if copilot_active then
      language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
    end

    if client_names_str_len == 0 and not copilot_active then
      return ""
    else
      M.language_servers = language_servers
      return language_servers:gsub(", anonymous source", "")
    end
  end,
  padding = 0,
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. "%*",
}

return {
  "nvim-lualine/lualine.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local lualine = require "lualine"

    vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#32363e" })
    vim.api.nvim_set_hl(0, "SLTermIcon", { fg = "#b668cd", bg = "#282c34" })
    vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#abb2bf", bg = "#32363e", bold = false })
    vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D7BA7D", bg = "#252525" })
    vim.api.nvim_set_hl(0, "SLProgress", { fg = "#abb2bf", bg = "#32363e" })
    vim.api.nvim_set_hl(0, "SLFG", { fg = "#abb2bf", bg = "#282c34" })
    vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#6b727f", bg = "#181826" })
    -- vim.api.nvim_set_hl(0, "SLLSP", { fg = "#abb2bf", bg = sl_hl.background })
    vim.api.nvim_set_hl(0, "SLLSP", { fg = "#D3CEAB", bg = "#282c34" })
    -- vim.api.nvim_set_hl(0, "SLLSP", { fg = "#5e81ac", bg = "#282c34" })
    vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644", bg = "#282c34" })

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
      -- color = "Constant",
      colored = false,
    }

    local hide_in_width_60 = function()
      return vim.o.columns > 60
    end

    local diff = {
      "diff",
      colored = true,
      symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " },
      cond = hide_in_width_60,
      separator = "%#SLSeparator#" ..  "%*",
    }

    lualine.setup {
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "toggleterm" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch, diff, "diagnostics" },
        lualine_c = { "filename" },
        -- lualine_x = { {"swenv", icon = ''}, lsp, "encoding", "filetype", "fileformat" },
        lualine_x = { { "swenv", icon = "" }, lanuage_server, "filetype" },
        -- lualine_x = { diff, lanuage_server, spaces, filetype },
        -- lualine_z = { progress },
        -- lualine_y = { location },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    }
  end,
}
