return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
    "benfowler/telescope-luasnip.nvim",
    "tom-anders/telescope-vim-bookmarks.nvim",
		"sopa0/telescope-makefile",
    "Myzel394/jsonfly.nvim",
    -- {'sunjon/shade.nvim', opts ={
    --   overlay_opacity = 70,
    --   opacity_step = 1,
    -- } }
  },
  lazy = true,
  event = "VeryLazy",
  cmd = "Telescope",
  config = function()
    -- require('telescope').load_extension('ultisnips')
    require('telescope').load_extension('vim_bookmarks')
    -- require('telescope').load_extension('make')
    require("telescope").load_extension("jsonfly")
    -- require("telescope").load_extension("yank_history")
    local icons = require "user.icons"
    local actions = require "telescope.actions"

    require("telescope").setup {
      defaults = {

        layout_strategy = "flex",
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_cutoff = 0,
        },
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = " ",
        -- path_display = { "smart" },
        path_display = { "truncate" },
        entry_prefix = "   ",
        selection_strategy = "reset",
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        sorting_strategy = nil,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        file_ignore_patterns = {
          ".git/",
          "target/",
          "docs/",
          "vendor/*",
          "%.lock",
          "__pycache__/*",
          "%.sqlite3",
          "%.ipynb",
          "node_modules/*",
          -- "%.jpg",
          -- "%.jpeg",
          -- "%.png",
          "%.svg",
          "%.otf",
          "%.ttf",
          "%.webp",
          ".dart_tool/",
          ".github/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "build/",
          "env/",
          "gradle/",
          "node_modules/",
          "%.pdb",
          "%.dll",
          "%.class",
          "%.exe",
          "%.cache",
          "%.ico",
          "%.pdf",
          "%.dylib",
          "%.jar",
          "%.docx",
          "%.met",
          "smalljre_*/*",
          ".vale/",
          "%.burp",
          "%.mp4",
          "%.mkv",
          "%.rar",
          "%.zip",
          "%.7z",
          "%.tar",
          "%.bz2",
          "%.epub",
          "%.flac",
          "%.tar.gz",
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-s>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<C-y>"] = actions.toggle_selection,
            -- ["<Tab>"] = actions.close,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
            ["<C-o>"] = function(p_bufnr)
              require("telescope.actions").send_selected_to_qflist(p_bufnr)
              vim.cmd.cfdo("edit")
            end,
            ["<esc>"] = actions.close,
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["q"] = actions.close,
            ["dd"] = require("telescope.actions").delete_buffer,
            ["s"] = actions.select_horizontal,
            ["v"] = actions.select_vertical,
            ["t"] = actions.select_tab,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        -- live_grep = {
        --   theme = "dropdown",
        -- },
        -- grep_string = {
        --   theme = "dropdown",
        -- },
        -- find_files = {
        --   theme = "dropdown",
        --   -- previewer = true,
        -- },
        buffers = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "insert",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        --
        -- planets = {
        --   show_pluto = true,
        --   show_moon = true,
        -- },
        --
        colorscheme = {
          enable_preview = true,
        },
        --
        -- lsp_references = {
        --   theme = "dropdown",
        --   initial_mode = "normal",
        -- },
        --
        -- lsp_definitions = {
        --   theme = "dropdown",
        --   initial_mode = "normal",
        -- },
        --
        -- lsp_declarations = {
        --   theme = "dropdown",
        --   initial_mode = "normal",
        -- },
        --
        -- lsp_implementations = {
        --   theme = "dropdown",
        --   initial_mode = "normal",
        -- },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
      },
    }
  end
}
