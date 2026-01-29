local M = {
"folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    opts = {},
    preset = "helix",
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = false,
      title_pos = "center",
      zindex = 1000,
    },
    -- ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local wk = require "which-key"

  -- icon colors
  -- azure, blue, cyan, green, grey, orange, purple, red, yellow

  wk.add {
    { "<localleader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment", icon ={" ", color = "gree"}, nowait = true, remap = false },

    { "<localleader>D", group = "Database", nowait = true, remap = false },
    { "<localleader>Da", "<cmd>DBUIAddConnection<cr>", desc = "Add Connection", nowait = true, remap = false },
    { "<localleader>Dc", "<cmd>DBCompletionClearCache<cr>", desc = "Clear Cache", nowait = true, remap = false },
    { "<localleader>Di", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info", nowait = true, remap = false },
    { "<localleader>Du", "<cmd>DBUIToggle<cr>", desc = "UI Toggle", nowait = true, remap = false },

    { "<localleader>L", group = "Lazy",   nowait = true, remap = false },
    { "<localleader>LC", "<cmd>Lazy clear<cr>", desc = "Clear", nowait = true, remap = false },
    { "<localleader>Lc", "<cmd>Lazy clean<cr>", desc = "Clean", nowait = true, remap = false },
    { "<localleader>Li", "<cmd>Lazy install<cr>", desc = "Install", nowait = true, remap = false },
    { "<localleader>Ls", "<cmd>Lazy sync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<localleader>Lu", "<cmd>Lazy update<cr>", desc = "Update", nowait = true, remap = false },

    {
      mode = { "n", "v" },
      { "<localleader>S", group = "SnipRun", icon = {icon = " ", color = "green"}, nowait = true, remap = false },
      { "<localleader>Sc", "<cmd>SnipClose<cr>", desc = "Close", nowait = true, remap = false },
      { "<localleader>Sf", "<cmd>%SnipRun<cr>", desc = "Run File", nowait = true, remap = false },
      { "<localleader>Si", "<cmd>SnipInfo<cr>", desc = "Info", nowait = true, remap = false },
      { "<localleader>Sm", "<cmd>SnipReplMemoryClean<cr>", desc = "Mem Clean", nowait = true, remap = false },
      { "<localleader>Sr", "<cmd>SnipReset<cr>", desc = "Reset", nowait = true, remap = false },
      { "<localleader>St", "<cmd>SnipRunToggle<cr>", desc = "Toggle", nowait = true, remap = false },
      { "<localleader>Sx", "<cmd>SnipTerminate<cr>", desc = "Terminate", nowait = true, remap = false },
    },

    { "<localleader>a", group = "Actions", icon = { icon = " ", color = "blue" }, mode = { "n", "v" }  },
    { "<localleader>ac", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Action", nowait = true, remap = false },

    { "<localleader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", nowait = true, remap = false },

    -- { "<localleader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT", nowait = true, remap = false },
    {
      mode = { "n", "v" },
    { "<localleader>c", group = "ChatGPT", icon = {icon = " ", color = "green"}, nowait = true, remap = false },
      { "<localleader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", nowait = true, remap = false },
      { "<localleader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", nowait = true, remap = false },
      { "<localleader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", nowait = true, remap = false },
      { "<localleader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", nowait = true, remap = false },
      { "<localleader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", nowait = true, remap = false },
      { "<localleader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", nowait = true, remap = false },
      { "<localleader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis", nowait = true, remap = false },
      { "<localleader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", nowait = true, remap = false },
      { "<localleader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", nowait = true, remap = false },
      { "<localleader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", nowait = true, remap = false },
      { "<localleader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", nowait = true, remap = false },
      { "<localleader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", nowait = true, remap = false },
    },


    { "<localleader>d", group = "Debug" },
    { "<localleader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "Out", nowait = true, remap = false },
    { "<localleader>db", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", desc = "Breakpoint", nowait = true, remap = false },
    { "<localleader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", nowait = true, remap = false },
    { "<localleader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Into", nowait = true, remap = false },
    { "<localleader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Last", nowait = true, remap = false },
    { "<localleader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Over", nowait = true, remap = false },
    { "<localleader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Repl", nowait = true, remap = false },
    { "<localleader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "UI", nowait = true, remap = false },
    { "<localleader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Exit", nowait = true, remap = false },

    { "<localleader>f", group = "Find", icon ={ icon = " ", color = "azure"} },
    { "<localleader>fC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<localleader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", nowait = true, remap = false },
    { "<localleader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights", nowait = true, remap = false },
    { "<localleader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<localleader>fR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<localleader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<localleader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", nowait = true, remap = false },
    { "<localleader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help", nowait = true, remap = false },
    { "<localleader>fi", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", desc = "Media", nowait = true, remap = false },
    { "<localleader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<localleader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search", nowait = true, remap = false },
    { "<localleader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File", nowait = true, remap = false },
    { "<localleader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find String", nowait = true, remap = false },
    { "<localleader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text", nowait = true, remap = false },

    { "<localleader>b", icon = { icon = " ", color = "yellow" }, group = "Bookmark" },
    { "<localleader>b,", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc = "Harpoon Prev", nowait = true, remap = false },
    { "<localleader>b.", '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc = "Harpoon Next", nowait = true, remap = false },
    { "<localleader>b;", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Harpoon UI", nowait = true, remap = false },
    { "<localleader>bS", "<cmd>silent BookmarkShowAll<cr>", desc = "Prev", nowait = true, remap = false },
    { "<localleader>ba", "<cmd>silent BookmarkAnnotate<cr>", desc = "Annotate", nowait = true, remap = false },
    { "<localleader>bt", "<cmd>silent BookmarkToggle<cr>", desc = "Toggle", nowait = true, remap = false },
    { "<localleader>bc", "<cmd>silent BookmarkClear<cr>", desc = "Clear", nowait = true, remap = false },
    { "<localleader>bn", "<cmd>silent BookmarkNext<cr>", desc = "Next", nowait = true, remap = false },
    { "<localleader>bp", "<cmd>silent BookmarkPrev<cr>", desc = "Prev", nowait = true, remap = false },
    { "<localleader>bl", "<cmd>lua require('user.bfs').open()<cr>", desc = "Buffers", nowait = true, remap = false },
    { "<localleader>bm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "Harpoon", nowait = true, remap = false },
    { "<localleader>bs", "<cmd>Telescope harpoon marks<cr>", desc = "Search Files", nowait = true, remap = false },
    { "<localleader>bx", "<cmd>BookmarkClearAll<cr>", desc = "Clear All", nowait = true, remap = false },

    { "<localleader>g", group = "Git" },
    { "<localleader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<localleader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<localleader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<localleader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
    { "<localleader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", nowait = true, remap = false },
    { "<localleader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<localleader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<localleader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame", nowait = true, remap = false },
    { "<localleader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<localleader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<localleader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<localleader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<localleader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    { "<localleader>gG", group = "Gist", nowait = true, remap = false },
    { "<localleader>gGa", "<cmd>Gist -b -a<cr>", desc = "Create Anon", nowait = true, remap = false },
    { "<localleader>gGd", "<cmd>Gist -d<cr>", desc = "Delete", nowait = true, remap = false },
    { "<localleader>gGf", "<cmd>Gist -f<cr>", desc = "Fork", nowait = true, remap = false },
    { "<localleader>gGg", "<cmd>Gist -b<cr>", desc = "Create", nowait = true, remap = false },
    { "<localleader>gGl", "<cmd>Gist -l<cr>", desc = "List", nowait = true, remap = false },
    { "<localleader>gGp", "<cmd>Gist -b -p<cr>", desc = "Create Private", nowait = true, remap = false },

    { "<localleader>l", group = "LSP", icon = { icon = " ", color = "grey" } },
    { "<localleader>lF", "<cmd>LspToggleAutoFormat<cr>", desc = "Toggle Autoformat", nowait = true, remap = false },
    { "<localleader>lH", "<cmd>IlluminationToggle<cr>", desc = "Toggle Doc HL", nowait = true, remap = false },
    { "<localleader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
    { "<localleader>lR", "<cmd>TroubleToggle lsp_references<cr>", desc = "References", nowait = true, remap = false },
    { "<localleader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    { "<localleader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<localleader>lc", "<cmd>lua require('user.lsp').server_capabilities()<cr>", desc = "Get Capabilities", nowait = true, remap = false },
    { "<localleader>ld", "<cmd>TroubleToggle<cr>", desc = "Diagnostics", nowait = true, remap = false },
    { "<localleader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format", nowait = true, remap = false },
    { "<localleader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<localleader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
    { "<localleader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
    { "<localleader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<localleader>lo", "<cmd>SymbolsOutline<cr>", desc = "Outline", nowait = true, remap = false },
    { "<localleader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
    { "<localleader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    { "<localleader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<localleader>lt", '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', desc = "Toggle Diagnostics", nowait = true, remap = false },
    { "<localleader>lu", "<cmd>LuaSnipUnlinkCurrent<cr>", desc = "Unlink Snippet", nowait = true, remap = false },
    { "<localleader>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Text", nowait = true, remap = false },
    { "<localleader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },

    {
      mode = { "n", "v" },
    { "<localleader>n", group = "Test", nowait = true, remap = false },
      { "<localleader>na", "<cmd>Neotest attach<CR>", desc = "Attach test", nowait = true, remap = false },
      { "<localleader>nj", "<cmd>Neotest jump<CR>", desc = "Jump test", nowait = true, remap = false },
      { "<localleader>no", "<cmd>Neotest output<CR>", desc = "Output test", nowait = true, remap = false },
      { "<localleader>np", "<cmd>Neotest output-panel<CR>", desc = "Output test in panel", nowait = true, remap = false },
      { "<localleader>nr", "<cmd>Neotest run<CR>", desc = "Run test", nowait = true, remap = false },
      { "<localleader>ns", "<cmd>Neotest stop<CR>", desc = "Stop test", nowait = true, remap = false },
      { "<localleader>ny", "<cmd>Neotest summary<CR>", desc = "Summarize test", nowait = true, remap = false },
    },


    { "<localleader>o", group = "Options", icon = {icon = " ", color = "azure"}, nowait = true, remap = false },
    { "<localleader>oC", "<cmd>lua vim.g.cmp_active=true<cr>", desc = "Completion on", nowait = true, remap = false },
    { "<localleader>oc", "<cmd>lua vim.g.cmp_active=false<cr>", desc = "Completion off", nowait = true, remap = false },
    { "<localleader>ol", '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', desc = "Cursorline", nowait = true, remap = false },
    { "<localleader>or", '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', desc = "Relative", nowait = true, remap = false },
    { "<localleader>os", '<cmd>lua require("user.functions").toggle_option("spell")<cr>', desc = "Spell", nowait = true, remap = false },
    { "<localleader>ot", '<cmd>lua require("user.functions").toggle_tabline()<cr>', desc = "Tabline", nowait = true, remap = false },
    { "<localleader>ow", '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', desc = "Wrap", nowait = true, remap = false },


    { "<localleader>s", group = "Session", icon = {icon = " ", color = "yellow"}, nowait = true, remap = false },
    { "<localleader>sd", "<cmd>Autosession delete<cr>", desc = "Find Delete", nowait = true, remap = false },
    { "<localleader>sf", "<cmd>Autosession search<cr>", desc = "Find", nowait = true, remap = false },
    { "<localleader>sr", "<cmd>RestoreSession<cr>", desc = "Restore", nowait = true, remap = false },
    { "<localleader>ss", "<cmd>SaveSession<cr>", desc = "Save", nowait = true, remap = false },
    { "<localleader>sx", "<cmd>DeleteSession<cr>", desc = "Delete", nowait = true, remap = false },


    { "<localleader>t", group = "Terminal", nowait = true, remap = false },
    { "<localleader>t1", ":1ToggleTerm<cr>", desc = "1", nowait = true, remap = false },
    { "<localleader>t2", ":2ToggleTerm<cr>", desc = "2", nowait = true, remap = false },
    { "<localleader>t3", ":3ToggleTerm<cr>", desc = "3", nowait = true, remap = false },
    { "<localleader>t4", ":4ToggleTerm<cr>", desc = "4", nowait = true, remap = false },
    { "<localleader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
    { "<localleader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
    { "<localleader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node", nowait = true, remap = false },
    { "<localleader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", nowait = true, remap = false },
    { "<localleader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", nowait = true, remap = false },
    { "<localleader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU", nowait = true, remap = false },
    { "<localleader>tu", "<cmd>lua _CARGO_RUN()<cr>", desc = "Cargo run", nowait = true, remap = false },
    { "<localleader>tu", "<cmd>lua _CARGO_TEST()<cr>", desc = "Cargo test", nowait = true, remap = false },
    { "<localleader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
  }
end

return M
