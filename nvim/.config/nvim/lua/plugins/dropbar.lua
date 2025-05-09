return {
  "Bekaboo/dropbar.nvim",
  -- commit = "19011d96959cd40a7173485ee54202589760caae",
  event = "VeryLazy",
  -- enabled = false,
  keys = {
    {
      "<Leader>;",
      function()
        local api = require("dropbar.api")
        api.pick()
      end,
      desc = "Pick from a list of options",
    },
    -- {
    --   "[c",
    --   function()
    --     local api = require("dropbar.api")
    --     api.goto_context_start()
    --   end,
    --   desc = "Go to the start of the current context",
    -- },
    -- {
    --   "]c",
    --   function()
    --     local api = require("dropbar.api")
    --     api.goto_context_end()
    --   end,
    --   desc = "Go to the next context",
    -- },
  },
  config = function()
    local api = require("dropbar.api")
    local confirm = function()
      local menu = api.get_current_dropbar_menu()
      if not menu then
        return
      end
      local cursor = vim.api.nvim_win_get_cursor(menu.win)
      local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
      if component then
        menu:click_on(component)
      end
    end

    local quit_curr = function()
      local menu = api.get_current_dropbar_menu()
      if menu then
        menu:close()
      end
    end

    require("dropbar").setup({
      menu = {
        -- When on, automatically set the cursor to the closest previous/next
        -- clickable component in the direction of cursor movement on CursorMoved
        quick_navigation = true,
        ---@type table<string, string|function|table<string, string|function>>
        keymaps = {
          ["<LeftMouse>"] = function()
            local menu = api.get_current_dropbar_menu()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            if mouse.winid ~= menu.win then
              local parent_menu = api.get_dropbar_menu(mouse.winid)
              if parent_menu and parent_menu.sub_menu then
                parent_menu.sub_menu:close()
              end
              if vim.api.nvim_win_is_valid(mouse.winid) then
                vim.api.nvim_set_current_win(mouse.winid)
              end
              return
            end
            menu:click_at({ mouse.line, mouse.column }, nil, 2, "l")
          end,
          ["<CR>"] = confirm,
          ["i"] = confirm,
          ["<esc>"] = quit_curr,
          ["q"] = quit_curr,
          ["n"] = quit_curr,
          ["<MouseMove>"] = function()
            local menu = api.get_current_dropbar_menu()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            if mouse.winid ~= menu.win then
              return
            end
            menu:update_hover_hl({ mouse.line, mouse.column - 1 })
          end,
        },
      },
    })
  end,
}
