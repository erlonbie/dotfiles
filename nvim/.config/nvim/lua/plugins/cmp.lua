local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-emoji",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    {
      "onsails/lspkind.nvim"
    },
    ----------------------------------------------------------------------
    --                             luasnip                              --
    ----------------------------------------------------------------------
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
    },
    {
      "L3MON4D3/LuaSnip",
      build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
      dependencies = {
        "honza/vim-snippets",
        "rafamadriz/friendly-snippets",
        "benfowler/telescope-luasnip.nvim",
      },
      config = function(_, opts)
        if opts then require("luasnip").config.setup(opts) end
        vim.tbl_map(
          function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
          { "vscode", "snipmate", "lua" }
        )
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
      end,
    },
    ----------------------------------------------------------------------
    --                             ultisnip                             --
    ----------------------------------------------------------------------
    -- { "quangnguyen30192/cmp-nvim-ultisnips" },
    -- {
    -- 	"sirver/ultisnips",
    -- 	dependencies = { "honza/vim-snippets" },
    -- },
  },
  event = "InsertEnter",
}

function M.config()

	----------------------------------------------------------------------
	--                         custom snippets                          --
	----------------------------------------------------------------------

	local ls = require("luasnip")
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
		return os.date("%d-%m-%Y")
	end

	local function comment_structure(text)
		local comment_str = vim.bo.commentstring

		if comment_str:find("%%s") then
			comment_str = comment_str:gsub("%%s", "")
		end

		-- Handling C-style block comments
		if comment_str:find("/%*") then
			return { "/* " .. text .. ": ", ", erlonbie> */" }
		else
			-- return { string.sub(comment_str, 1, -2) .. text .. ': ', ', erlonbie> ' }
			return { comment_str .. text .. ": ", ", erlonbie> " }
		end
	end

  ls.add_snippets("all", {
    s('mytodo', {
      f(function()
		return comment_structure("TODO")[1]
      end, {}),            -- Inserts the first part of the comment
      i(0),                -- The place where the cursor will be after expanding the snippet
      t(' <'),             -- Static text
      f(current_date, {}), -- Inserts the current date
      f(function()
		return comment_structure("TODO")[2]
      end, {}),            -- Inserts the second part of the comment
    }),
    s('mywarn', {
      f(function()
		return comment_structure("WARN")[1]
      end, {}),
      i(0),
      t(' <'),
      f(current_date, {}),
      f(function()
		return comment_structure("WARN")[2]
      end, {}),
    }),
    s('mynote', {
      f(function()
		return comment_structure("NOTE")[1]
      end, {}),
      i(0),
      t(' <'),
      f(current_date, {}),
      f(function()
		return comment_structure("NOTE")[2]
      end, {}),
    }),
    s('mybug', {
      f(function()
		return comment_structure("BUG")[1]
      end, {}),
      i(0),
      t(' <'),
      f(current_date, {}),
      f(function()
        return comment_structure("BUG")[2]
      end, {}),
    }),
  })

  ----------------------------------------------------------------------
  --                                                                  --
  ----------------------------------------------------------------------

	-- require("tailwindcss-colorizer-cmp").setup({
	-- 	color_square_width = 2,
	-- })
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })


  local cmp = require "cmp"
  ----------------------------------------------------------------------
  --                             luasnip                              --
  ----------------------------------------------------------------------
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("typescriptreact", { "html" })
  ----------------------------------------------------------------------
  --                             ultisnip                             --
  ----------------------------------------------------------------------
  -- local ELLIPSIS_CHAR = "…"
  -- local MAX_LABEL_WIDTH = 25
  -- local MAX_KIND_WIDTH = 14
  -- local snippet_separator = string.rep("-", MAX_KIND_WIDTH)
  -- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
  -- local cmp_ultisnips = require("cmp_nvim_ultisnips").setup({
  --         filetype_source = "treesitter",
  --         show_snippets = "all",
  --         documentation = function(snippet)
  --                 return snippet.description .. "\n" .. snippet_separator .. "\n" .. snippet.value
  --         end,
  -- })

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local lspkind_ok, lspkind = pcall(require, "lspkind")
  if not lspkind_ok then
    return
  end

  local tail_col_cmp_ok, tailwindcss_colorizer_cmp = pcall(require, "tailwindcss-colorizer-cmp")
  if not tail_col_cmp_ok then
    return
  end

  local types = require("cmp.types")

  local function deprioritize_snippet(entry1, entry2)
    if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
    if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
  end

  local icons = require "user.icons"

  cmp.setup {
    -- sorting = {
    -- priority_weight = 2,
    --   comparators = {
    --     -- deprioritize_snippet,
    --     -- the rest of the comparators are pretty much the defaults
    --     -- cmp.config.compare.offset,
    --     -- cmp.config.compare.exact,
    --     -- cmp.config.compare.scopes,
    --     -- cmp.config.compare.score,
    --     -- cmp.config.compare.recently_used,
    --     -- cmp.config.compare.locality,
    --     -- cmp.config.compare.kind,
    --     -- cmp.config.compare.sort_text,
    --     -- cmp.config.compare.length,
    --     -- cmp.config.compare.order,
    --   },
    -- },
  ----------------------------------------------------------------------
  --                             luasnip                              --
  ----------------------------------------------------------------------
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
  ----------------------------------------------------------------------
  --                             ultisnip                             --
  ----------------------------------------------------------------------
    -- snippet = {
    --     expand = function(args)
    --         vim.fn["UltiSnips#Anon"](args.body)
    --     end,
    -- },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ----------------------------------------------------------------------
      --                             luasnip                              --
      ----------------------------------------------------------------------
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- elseif luasnip.expandable() then
        --   luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ----------------------------------------------------------------------
      --                             ultisnip                             --
      ----------------------------------------------------------------------
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_next_item()
      --   else
      --     cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      --   end
      -- end, {
      --   "i",
      --   "s",
      -- }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   cmp_ultisnips_mappings.jump_backwards(fallback)
      -- end, {
      --   "i",
      --   "s", --[[ "c" (to enable the mapping in command mode) ]]
      -- }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({
          mode = "symbol_text",
        })(entry, vim.deepcopy(vim_item))
        local highlights_info = require("colorful-menu").cmp_highlights(entry)
        -- if highlight_info==nil, which means missing ts parser, let's fallback to use default `vim_item.abbr`.
        -- What this plugin offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
        if highlights_info ~= nil then
          vim_item.abbr_hl_group = highlights_info.highlights
          vim_item.abbr = highlights_info.text
        end
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        local icon = icons.kind[strings[2]] or ""
        -- vim_item.kind = "" .. (strings[1] or "") .. " "
        vim_item.kind = "" .. icon .. " "
        vim_item.menu =  ""
        -- vim_item.menu = strings[2] or ""
        return vim_item
      end,
    },
    ----------------------------------------------------------------------
    --                             luasnip                              --
    ----------------------------------------------------------------------
    sources = {
      { name = "luasnip" },
      { name = "copilot" },
      {
        name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
          if kind == "Snippet" and ctx.prev_context.filetype == "java" then
            return false
          end

          if ctx.prev_context.filetype == "markdown" then
            return true
          end

          if kind == "Text" then
            return false
          end

          return true
        end,
      },
      { name = "cmp_tabnine" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
      { name = "calc" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "crates" },
      { name = "tmux" },
    },
    ----------------------------------------------------------------------
    --                             ultisnip                             --
    ----------------------------------------------------------------------
    -- sources = {
    --   { name = "crates",                    group_index = 1 },
    --   { name = "ultisnips",                 group_index = 2 },
    --   { name = "copilot",                   group_index = 2 },
    --   { name = "nvim_lsp",                  group_index = 2 },
    --   { name = "tailwindcss-colorizer-cmp", group_index = 2 },
    --   { name = "lab.quick_data",            keyword_length = 4, group_index = 2 },
    --   { name = "nvim_lua",                  group_index = 2 },
    --   -- { name = "luasnip", group_index = 2 },
    --   { name = "buffer",                    group_index = 2 },
    --   { name = "path",                      group_index = 2 },
    -- },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      -- completion = {
      --   border = "rounded",
      --   winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
      --   col_offset = -3,
      --   side_padding = 1,
      --   scrollbar = false,
      --   scrolloff = 8,
      -- },
      -- documentation = {
      --   border = "rounded",
      --   winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
      -- },
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:Visual",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:Visual",
		}),
    },
    experimental = {
      ghost_text = { enabled = true },
    },
  }

	cmp.setup.filetype({"sql"}, {
		sources = {
			{ name = "vimd-dadbod-completion"},
			{ name = "buffer"}
		}
	})

  pcall(function()
    local function on_confirm_done(...)
      require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
    end
    require("cmp").event:off("confirm_done", on_confirm_done)
    require("cmp").event:on("confirm_done", on_confirm_done)
  end)
end

return M


-- local M = {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     {
--       "hrsh7th/cmp-nvim-lsp",
--       event = "InsertEnter",
--     },
--     {
--       "hrsh7th/cmp-emoji",
--       event = "InsertEnter",
--     },
--     {
--       "hrsh7th/cmp-buffer",
--       event = "InsertEnter",
--     },
--     {
--       "hrsh7th/cmp-path",
--       event = "InsertEnter",
--     },
--     {
--       "hrsh7th/cmp-cmdline",
--       event = "InsertEnter",
--     },
--     {
--       "saadparwaiz1/cmp_luasnip",
--       event = "InsertEnter",
--     },
--     {
--       "L3MON4D3/LuaSnip",
--       event = "InsertEnter",
--       dependencies = {
--         "rafamadriz/friendly-snippets",
--       },
--     },
--     {
--       "hrsh7th/cmp-nvim-lua",
--     },
--     {
--       "roobert/tailwindcss-colorizer-cmp.nvim",
--     },
--   },
--   event = "InsertEnter",
-- }
--
-- function M.config()
--   require("tailwindcss-colorizer-cmp").setup {
--     color_square_width = 2,
--   }
--
--   vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
--   vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
--   vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
--   vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
--
--   local cmp = require "cmp"
--   local luasnip = require "luasnip"
--   require("luasnip/loaders/from_vscode").lazy_load()
--   require("luasnip").filetype_extend("typescriptreact", { "html" })
--
--   local check_backspace = function()
--     local col = vim.fn.col "." - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--   end
--
--   local icons = require "user.icons"
--   local types = require "cmp.types"
--
--   cmp.setup {
--     snippet = {
--       expand = function(args)
--         luasnip.lsp_expand(args.body) -- For `luasnip` users.
--       end,
--     },
--     mapping = cmp.mapping.preset.insert {
--       ["<C-k>"] = cmp.mapping(
--         cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
--         { "i", "c" }
--       ),
--       ["<C-j>"] = cmp.mapping(
--         cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
--         { "i", "c" }
--       ),
--       ["<C-p>"] = cmp.mapping(
--         cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
--         { "i", "c" }
--       ),
--       ["<C-n>"] = cmp.mapping(
--         cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
--         { "i", "c" }
--       ),
--       ["<C-h>"] = function()
--         if cmp.visible_docs() then
--           cmp.close_docs()
--         else
--           cmp.open_docs()
--         end
--       end,
--       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--       ["<C-e>"] = cmp.mapping {
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--       },
--       -- Accept currently selected item. If none selected, `select` first item.
--       -- Set `select` to `false` to only confirm explicitly selected items.
--       ["<CR>"] = cmp.mapping.confirm { select = true },
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--         elseif luasnip.expandable() then
--           luasnip.expand()
--         elseif luasnip.expand_or_jumpable() then
--           luasnip.expand_or_jump()
--         elseif check_backspace() then
--           -- fallback()
--           require("neotab").tabout()
--         else
--           require("neotab").tabout()
--           -- fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           luasnip.jump(-1)
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--     },
--     formatting = {
--       fields = { "kind", "abbr", "menu" },
--       format = function(entry, vim_item)
--         vim_item.kind = icons.kind[vim_item.kind]
--         vim_item.menu = ({
--           nvim_lsp = "",
--           nvim_lua = "",
--           luasnip = "",
--           buffer = "",
--           path = "",
--           emoji = "",
--         })[entry.source.name]
--
--         if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
--           local duplicates = {
--             buffer = 1,
--             path = 1,
--             nvim_lsp = 0,
--             luasnip = 1,
--           }
--
--           local duplicates_default = 0
--
--           vim_item.dup = duplicates[entry.source.name] or duplicates_default
--         end
--
--         if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
--           local words = {}
--           for word in string.gmatch(vim_item.word, "[^-]+") do
--             table.insert(words, word)
--           end
--
--           local color_name, color_number
--           if
--             words[2] == "x"
--             or words[2] == "y"
--             or words[2] == "t"
--             or words[2] == "b"
--             or words[2] == "l"
--             or words[2] == "r"
--           then
--             color_name = words[3]
--             color_number = words[4]
--           else
--             color_name = words[2]
--             color_number = words[3]
--           end
--
--           if color_name == "white" or color_name == "black" then
--             local color
--             if color_name == "white" then
--               color = "ffffff"
--             else
--               color = "000000"
--             end
--
--             local hl_group = "lsp_documentColor_mf_" .. color
--             -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
--             vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
--             vim_item.kind_hl_group = hl_group
--
--             -- make the color square 2 chars wide
--             vim_item.kind = string.rep("▣", 1)
--
--             return vim_item
--           elseif #words < 3 or #words > 4 then
--             -- doesn't look like this is a tailwind css color
--             return vim_item
--           end
--
--           if not color_name or not color_number then
--             return vim_item
--           end
--
--           local color_index = tonumber(color_number)
--           local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors
--
--           if not tailwindcss_colors[color_name] then
--             return vim_item
--           end
--
--           if not tailwindcss_colors[color_name][color_index] then
--             return vim_item
--           end
--
--           local color = tailwindcss_colors[color_name][color_index]
--
--           local hl_group = "lsp_documentColor_mf_" .. color
--           -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
--           vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
--
--           vim_item.kind_hl_group = hl_group
--
--           -- make the color square 2 chars wide
--           vim_item.kind = string.rep("▣", 1)
--
--           -- return vim_item
--         end
--
--         if entry.source.name == "copilot" then
--           vim_item.kind = icons.git.Octoface
--           vim_item.kind_hl_group = "CmpItemKindCopilot"
--         end
--
--         if entry.source.name == "cmp_tabnine" then
--           vim_item.kind = icons.misc.Robot
--           vim_item.kind_hl_group = "CmpItemKindTabnine"
--         end
--
--         if entry.source.name == "crates" then
--           vim_item.kind = icons.misc.Package
--           vim_item.kind_hl_group = "CmpItemKindCrate"
--         end
--
--         if entry.source.name == "lab.quick_data" then
--           vim_item.kind = icons.misc.CircuitBoard
--           vim_item.kind_hl_group = "CmpItemKindConstant"
--         end
--
--         if entry.source.name == "emoji" then
--           vim_item.kind = icons.misc.Smiley
--           vim_item.kind_hl_group = "CmpItemKindEmoji"
--         end
--
--         return vim_item
--       end,
--     },
--     sources = {
--       { name = "copilot" },
--       {
--         name = "nvim_lsp",
--         entry_filter = function(entry, ctx)
--           local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
--           if kind == "Snippet" and ctx.prev_context.filetype == "java" then
--             return false
--           end
--
--           if ctx.prev_context.filetype == "markdown" then
--             return true
--           end
--
--           if kind == "Text" then
--             return false
--           end
--
--           return true
--         end,
--       },
--       { name = "luasnip" },
--       { name = "cmp_tabnine" },
--       { name = "nvim_lua" },
--       { name = "buffer" },
--       { name = "path" },
--       { name = "calc" },
--       { name = "emoji" },
--       { name = "treesitter" },
--       { name = "crates" },
--       { name = "tmux" },
--     },
--     confirm_opts = {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     },
--     view = {
--       entries = {
--         name = "custom",
--         selection_order = "top_down",
--       },
--       docs = {
--         auto_open = false,
--       },
--     },
--     window = {
--       completion = {
--         border = "rounded",
--         winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
--         col_offset = -3,
--         side_padding = 1,
--         scrollbar = false,
--         scrolloff = 8,
--       },
--       documentation = {
--         border = "rounded",
--         winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
--       },
--     },
--     experimental = {
--       ghost_text = false,
--     },
--   }
--
--   pcall(function()
--     -- local function on_confirm_done(...)
--     --   require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
--     -- end
--     -- require("cmp").event:off("confirm_done", on_confirm_done)
--     -- require("cmp").event:on("confirm_done", on_confirm_done)
--   end)
-- end
--
-- return M
