local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  -- use { "akinsho/bufferline.nvim", commit = "2e5d92e" }
  use "akinsho/bufferline.nvim"
  use{  "folke/todo-comments.nvim", commit = "6124066" }
  use {
    's1n7ax/nvim-comment-frame',
    requires = {
      { 'nvim-treesitter' }
    },
    config = function()
      require('nvim-comment-frame').setup()
    end
  }
  use "moll/vim-bbye"
  use "christianchiarulli/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "christianchiarulli/hop.nvim"
  -- use "phaazon/hop.nvim"
  -- Lua
  use "kylechui/nvim-surround"
  -- Lua
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }
  -- use "nacro90/numb.nvim"
  -- use "monaqa/dial.nvim"
  -- use "norcalli/nvim-colorizer.lua"
  use "NvChad/nvim-colorizer.lua"
  -- use {'rrethy/vim-hexokinase',
  --       run = 'make hexokinase'
  -- }
  use "windwp/nvim-spectre"
  use "kevinhwang91/nvim-bqf"
  use "ThePrimeagen/harpoon"
  use "MattesGroeger/vim-bookmarks"
  -- use "Mephistophiles/surround.nvim"
  use { "michaelb/sniprun", run = "bash ./install.sh" }
  use {

    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Session
  use "rmagatti/auto-session"
  use "rmagatti/session-lens"

  -- UI
  -- use "mhinz/vim-startify"
  use 'tribela/vim-transparent'
  use 'j-hui/fidget.nvim'
  use "rcarriga/nvim-notify"

  -- use "stevearc/dressing.nvim"
  -- use "ghillb/cybu.nvim"
  --use {
  --"SmiteshP/nvim-navic",
  --requires = "neovim/nvim-lspconfig",
  --}
  -- use "tversteeg/registers.nvim"
  -- use "rcarriga/nvim-notify"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  -- use "tamago324/lir.nvim"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  -- use "folke/zen-mode.nvim"
  use "karb94/neoscroll.nvim"
  -- use { "lvimuser/lsp-inlayhints.nvim", commit = "4317916" }
  use {"lvimuser/lsp-inlayhints.nvim", commit = "0948ecb196b7b288459fad478480359bbf315bee"}
  -- use "folke/todo-comments.nvim"
  -- use "andymass/vim-matchup"
  use "is0n/jaq-nvim"
  use { '0x100101/lab.nvim', run = 'cd js && npm ci', requires = { 'nvim-lua/plenary.nvim' } }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  }

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "lunarvim/onedarker.nvim"
  use "sainnhe/gruvbox-material"
  use 'Mofiqul/dracula.nvim'
  use "rebelot/kanagawa.nvim"
  use "lunarvim/horizon.nvim"

  use { "hrsh7th/nvim-cmp" }
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "honza/vim-snippets"
  use { "sirver/ultisnips",
    use {
      'fhill2/telescope-ultisnips.nvim',
      config = function()
        require 'telescope'.load_extension('ultisnips')
      end
    },
    requires = { "honza/vim-snippets" },
    -- config = function()
    --   vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
    --   vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
    --   vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
    --   vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
    --   vim.g.UltiSnipsRemoveSelectModeMappings = 1
    -- end,
  }
  use { "quangnguyen30192/cmp-nvim-ultisnips", requires = "nvim-treesitter/nvim-treesitter" }

  -- LSP
  -- use { "neovim/nvim-lspconfig", commit = "165295d" } -- enable LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "simrat39/symbols-outline.nvim"
  -- use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  -- use "folke/trouble.nvim"
  -- use "github/copilot.vim"
  use "RRethy/vim-illuminate"
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })
  -- use "stevearc/aerial.nvim"
  -- use "j-hui/fidget.nvim"
  -- TODO: set this up
  -- use "rmagatti/goto-preview"
  -- use "nvim-lua/lsp_extensions.nvim"
  -- use "christianchiarulli/lsp-inlay-hints"
  -- use {"christianchiarulli/lsp-inlayhints.nvim", branch="user-config"}

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Rust
  -- use { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }
  use { "simrat39/rust-tools.nvim"}
  -- use { "simrat39/rust-tools.nvim" }
  use "Saecki/crates.nvim"

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  -- use "jose-elias-alvarez/typescript.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "benfowler/telescope-luasnip.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  -- use "nvim-telescope/telescope-media-files.nvim"
  -- use "lalitmee/browse.nvim"

  -- Treesitter
  use "preservim/tagbar"
  use { "nvim-treesitter/nvim-treesitter" }
  -- use {"nvim-treesitter/nvim-treesitter", commit = "668de0951a36ef17016074f1120b6aacbe6c4515"}
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  -- use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  -- use "drybalka/tree-climber.nvim"
  use 'David-Kunz/markid'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use 'tpope/vim-fugitive'
  -- use "f-person/git-blame.nvim"
  -- use "ruifm/gitlinker.nvim"
  -- use "mattn/vim-gist"
  -- use "mattn/webapi-vim"

  -- DAP
  use "mfussenegger/nvim-dap"
  -- use{  "theHamsta/nvim-dap-virtual-text",
  --   config= function ()
  --     require("dap.nvim-dap-virtual-text")
  --   end
  -- }
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"
  use 'mfussenegger/nvim-dap-python'
  use 'puremourning/vimspector'


  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  -- require('ufo').setup({
  --   provider_selector = function(bufnr, filetype, buftype)
  --       return {'treesitter', 'indent'}
  --   end
  -- })
  use {
    'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use { 'turbio/bracey.vim', run = "npm install --prefix server" }
  use "p00f/cphelper.nvim"


  use("tpope/vim-dadbod")
  use("tpope/vim-dotenv")
  use({
    "kristijanhusak/vim-dadbod-ui",
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
      "tpope/vim-dotenv",
    },
  })

  use 'AckslD/swenv.nvim'
  use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter", }
  use { 'dccsillag/magma-nvim'}

  use "MunifTanjim/nui.nvim"
  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  })
  
  use "p00f/clangd_extensions.nvim"

  use { "catppuccin/nvim", as = "catppuccin" }
  use "metakirby5/codi.vim"
  use 'Mofiqul/vscode.nvim'
  use 'edgedb/edgedb-vim'

  -- use "github/copilot.vim"

  -- use {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   -- event = "VimEnter",
  --   config = function()
  --     vim.defer_fn(function()
  --       require ("user.copilot").setup()
  --     end, 101)
  --   end,
  -- }
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require ("copilot").setup()
  --     end, 100)
  --   end,
  -- }
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- event = "InsertEnter",
    event = "VimEnter",
    config = function()
      require("user.copilot")
      -- require("copilot").setup()
    end,
  }
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup{
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
		end,
	})

  use 'Bryley/neoai.nvim'

  use { "theRealCarneiro/hyprland-vim-syntax",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      ft = "hypr",
  }
-- use {
--     "SmiteshP/nvim-navbuddy",
--     requires = {
--         "neovim/nvim-lspconfig",
--         "SmiteshP/nvim-navic",
--         "MunifTanjim/nui.nvim"
--     }
-- }

  -- Plugin Graveyard
  -- use "romgrk/nvim-treesitter-context"
  -- use "mizlan/iswap.nvim"
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  -- use "nvim-telescope/telescope-ui-select.nvim"
  -- use "nvim-telescope/telescope-file-browser.nvim"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
  -- use { "christianchiarulli/JABS.nvim" }
  -- use "lunarvim/vim-solidity"
  -- use "tpope/vim-repeat"
  -- use "Shatur/neovim-ession-manager"
  -- use "metakirby5/codi.vim"
  -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
  -- use "rcarriga/cmp-dap"
  -- use "filipdutescu/renamer.nvim"
  -- use "https://github.com/rhysd/conflict-marker.vim"
  -- use "rebelot/kanagawa.nvim"
  -- use "unblevable/quick-scope"
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "gbprod/cutlass.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
