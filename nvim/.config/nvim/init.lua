require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.functions")

----------------------------------------------------------------------
--                           Essential                             --
----------------------------------------------------------------------

spec "plugins.alpha"
spec "plugins.auto-session"
spec "plugins.autopairs"
spec "plugins.bufferline"
spec "plugins.blink"
-- spec "plugins.cmp"
spec "plugins.colorscheme"
spec "plugins.comment"
spec "plugins.devicons"
-- spec "plugins.devcontainer"
spec "plugins.dropbar"
spec "plugins.gitsigns"
spec "plugins.illuminate"
spec "plugins.lspconfig"
spec "plugins.lualine"
-- spec "plugins.mason"
spec "plugins.neotree"
spec "plugins.navbuddy"
-- spec "plugins.none-ls"
spec "plugins.nvimufo"
spec "plugins.telescope"
-- spec "plugins.fzflua"
spec "plugins.treesitter"
spec "plugins.toggleterm"
spec "plugins.whichkey"

----------------------------------------------------------------------
--                             Extras                              --
----------------------------------------------------------------------

-- spec "plugins.aerial"
spec "plugins.avante"
-- spec "plugins.codecompanion"
-- spec "plugins.claude-code"
spec "plugins.bookmark"
spec "plugins.bqf"
-- spec "plugins.chatgpt"
spec "plugins.colorizer"
spec "plugins.conform"
spec "plugins.copilot"
spec "plugins.colorful-menu"
spec "plugins.crates"
spec "plugins.dap"
spec "plugins.dadobd"
spec "plugins.diffview"
spec "plugins.dressing"
spec "plugins.edgy"
spec "plugins.eyeliner"
spec "plugins.flash"
-- spec "plugins.flog"
spec "plugins.git-blame"
-- spec "plugins.harpoon"
spec "plugins.indentline"
-- spec "plugins.inlayhint-filler"
spec "plugins.jaq"
spec "plugins.kulala"
spec "plugins.lsp-lines"
-- spec "plugins.menu"
spec "plugins.multiple-cursors"
-- spec "plugins.namu"
-- spec "plugins.neotest"
spec "plugins.nvim-lint"
spec "plugins.noice"
-- spec "plugins.oil"
-- spec "plugins.orphans"
spec "plugins.outline"
-- spec "plugins.package-info"
spec "plugins.persistent-breakpoints"
-- spec "plugins.phpactor"
spec "plugins.pqf"
spec "plugins.project"
spec "plugins.refactoring"
spec "plugins.smoothie"
-- spec "plugins.sniprun"
spec "plugins.spectre"
spec "plugins.surround"
-- spec "plugins.tailwindcss-colorizer-cmp"
-- spec "plugins.tabby"
spec "plugins.todo-comments"
spec "plugins.treesj"
spec "plugins.trouble"
-- spec "plugins.twilight"
spec "plugins.vim-tmux-navigator"

----------------------------------------------------------------------
--                            Languages                             --
----------------------------------------------------------------------

-- spec "plugins.clangd-extensions"
-- spec "plugins.edgedb"
-- spec "plugins.go"
-- spec "plugins.java"
spec "plugins.typescript-tools"
-- spec "plugins.rustacean"

require("user.lazy")
