return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  -- dependencies = "rafamadriz/friendly-snippets",
  dependencies = {
    "L3MON4D3/LuaSnip",
    build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
    dependencies = {
      "honza/vim-snippets",
      "rafamadriz/friendly-snippets",
      "benfowler/telescope-luasnip.nvim",
      "moyiz/blink-emoji.nvim",
    },
    config = function(_, opts)
      if opts then
        require("luasnip").config.setup(opts)
      end
      vim.tbl_map(function(type)
        require("luasnip.loaders.from_" .. type).lazy_load()
      end, { "vscode", "snipmate", "lua" })
      -- friendly-snippets - enable standardized comments snippets
      require("luasnip").filetype_extend("typescript", { "tsdoc" })
      require("luasnip").filetype_extend("javascript", { "jsdoc" })
      require("luasnip").filetype_extend("lua", { "luadoc" })
      require("luasnip").filetype_extend("python", { "pydoc" })
      require("luasnip").filetype_extend("rust", { "rustdoc" })
      require("luasnip").filetype_extend("cs", { "csharpdoc" })
      require("luasnip").filetype_extend("java", { "javadoc" })
      require("luasnip").filetype_extend("c", { "cdoc" })
      require("luasnip").filetype_extend("cpp", { "cppdoc" })
      require("luasnip").filetype_extend("php", { "phpdoc" })
      require("luasnip").filetype_extend("kotlin", { "kdoc" })
      require("luasnip").filetype_extend("ruby", { "rdoc" })
      require("luasnip").filetype_extend("sh", { "shelldoc" })

      ----------------------------------------------------------------------
      --                         custom snippets                          --
      ----------------------------------------------------------------------

      local ls = require "luasnip"
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      -- local extras = require("luasnip.extras")
      -- local rep = extras.rep
      -- local fmt = require("luasnip.extras.fmt").fmt
      -- local c = ls.choice_node
      -- local d = ls.dynamic_node
      -- local sn = ls.snippet_node

      -- Function to return the current date in the format 'dd-mm-yy'
      local function current_date()
        return os.date "%d-%m-%Y"
      end

      local function comment_structure(text)
        local comment_str = vim.bo.commentstring

        if comment_str:find "%%s" then
          comment_str = comment_str:gsub("%%s", "")
        end

        -- Handling C-style block comments
        if comment_str:find "/%*" then
          return { "/* " .. text .. ": ", ", erlonbie> */" }
        else
          -- return { string.sub(comment_str, 1, -2) .. text .. ': ', ', erlonbie> ' }
          return { comment_str .. text .. ": ", ", erlonbie> " }
        end
      end

      ls.add_snippets("all", {
        s("mytodo", {
          f(function()
            return comment_structure("TODO")[1]
          end, {}), -- Inserts the first part of the comment
          i(0), -- The place where the cursor will be after expanding the snippet
          t " <", -- Static text
          f(current_date, {}), -- Inserts the current date
          f(function()
            return comment_structure("TODO")[2]
          end, {}), -- Inserts the second part of the comment
        }),
        s("mywarn", {
          f(function()
            return comment_structure("WARN")[1]
          end, {}),
          i(0),
          t " <",
          f(current_date, {}),
          f(function()
            return comment_structure("WARN")[2]
          end, {}),
        }),
        s("mynote", {
          f(function()
            return comment_structure("NOTE")[1]
          end, {}),
          i(0),
          t " <",
          f(current_date, {}),
          f(function()
            return comment_structure("NOTE")[2]
          end, {}),
        }),
        s("mybug", {
          f(function()
            return comment_structure("BUG")[1]
          end, {}),
          i(0),
          t " <",
          f(current_date, {}),
          f(function()
            return comment_structure("BUG")[2]
          end, {}),
        }),
      })
    end,
  },

  -- use a release tag to download pre-built binaries
  version = "*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = "default",

      -- "enter" keymap
      -- you may want to set `completion.list.selection = "manual" | "auto_insert"`

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
      -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    snippets = { preset = "luasnip" },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = function(ctx)
          return not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()) or ctx.mode ~= "cmdline"
        end,
        border = "single",

        draw = {
          -- We don't need label_description now because label and label_description are already
          -- conbined together in label by colorful-menu.nvim.
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              width = { fill = true, max = 150 },
              text = function(ctx)
                local highlights_info = require("colorful-menu").blink_highlights(ctx)
                if highlights_info ~= nil then
                  -- Or you want to add more item to label
                  return highlights_info.label
                else
                  return ctx.label
                end
              end,
              highlight = function(ctx)
                local highlights = {}
                local highlights_info = require("colorful-menu").blink_highlights(ctx)
                if highlights_info ~= nil then
                  highlights = highlights_info.highlights
                end
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                end
                -- Do something else
                return highlights
              end,
            },
          },
        },

        -- draw = {
        --   columns = { { "item_idx" }, { "seperator" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
        --   components = {
        --     kind_icon = {
        --       text = function(ctx)
        --         return " " .. ctx.kind_icon .. ctx.icon_gap
        --       end,
        --     },
        --     item_idx = {
        --       text = function(ctx)
        --         return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
        --       end,
        --       highlight = "comment",
        --     },
        --     seperator = {
        --       text = function()
        --         return "│"
        --       end,
        --       highlight = "comment",
        --     },
        --   },
        --   gap = 1,
        --   treesitter = { "lsp" },
        -- },
      },
      list = {
        selection = { auto_insert = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "single",
        },
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },

    -- experimental signature help support
    signature = { enabled = false, window = { border = "single" } },

    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
      kind_icons = {
        Text = "󰉿",
        Method = "",
        Function = "󰊕",
        Constructor = "󰒓",

        Field = "󰜢",
        Variable = "󰆦",
        Property = "󰖷",

        Class = "󱡠",
        Interface = "󱡠",
        Struct = "󱡠",
        Module = "󰅩",

        Unit = "󰪚",
        Value = "󰦨",
        Enum = "󰦨",
        EnumMember = "󰦨",

        Keyword = "󰻾",
        Constant = "󰏿",

        Snippet = "󱄽",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "󰬛",
        Error = "󰏭",
        Warning = "󰏯",
        Information = "󰏮",
        Hint = "󰏭",
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      -- default = { "lsp", "path", "snippets", "buffer", "dadbod" ,"emoji" },
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
          min_keyword_length = 2,
          score_offset = 85, -- the higher the number, the higher the priority
        },
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
          -- should_show_items = function()
          --   return vim.tbl_contains(
          --     -- Enable emoji completion only for git commits and markdown.
          --     -- By default, enabled for all file-types.
          --     { "gitcommit", "markdown" },
          --     vim.o.filetype
          --   )
          -- end,
        }

      }
      -- cmdline = {},
    },
    cmdline = { enabled = false},
  },
  opts_extend = { "sources.default" },
}
