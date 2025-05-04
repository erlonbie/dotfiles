local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig", -- enable LSP
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

function M.config(_, opts)
	local conf = vim.tbl_deep_extend('keep', opts, {
		ui = {
			icons = {
				package_installed = '✓',
				package_pending = '➜',
				package_uninstalled = '✗',
			},
		},
	})

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "html",
  -- "jdtls",
  "jsonls",
  -- "solc",
  -- "solidity_ls",
  -- "sumneko_lua",
  "lua_ls",
  "kotlin_language_server",
  "tflint",
  "terraformls",
  "ts_ls",
  "pyright",
  -- "pylsp",
  "yamlls",
  "bashls",
  "clangd",
  -- "ccls",
  -- "sqls",
  "sqlls",
  -- "phpactor",
  "intelephense",
  -- "emmet_ls",
  "gopls",
  "omnisharp",
  "rust_analyzer",
  "taplo",
  "zk@v0.10.1",
  "vimls",
  "cmake",
  "angularls",
  "awk_ls",
  "dockerls",
  "tailwindcss",
  "lemminx",
  -- "arduino_language_server"
}

local status_ok_2, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok_2 then
	return
end

local lint_and_formatters = {
    "java-debug-adapter",
    "java-test",
    "black",
    "beautysh",
    "isort",
    "php-cs-fixer",
    "xmlformatter",
    "clang-format",
    "htmlbeautifier",
    "prettier",
    "shfmt",
    "stylua",
    "google-java-format",
    "checkstyle",
    "cpplint",
    "ruff",
    -- "ruff_lsp",
    "goimports",
    "eslint_d",
    "phpstan",
    "tflint",
    "golangci-lint",
    -- "gospel",
    "gomodifytags",
    "rustywind",
    "prettierd",
	  "jsonlint"
    -- "proselint"
    -- "phpcs",
}

mason_tool_installer.setup({
    ensure_installed = lint_and_formatters,
})

local settings = {
	ensure_installed = servers,
	ui = {
		border = "rounded",
		width = 0.8,
		height = 0.8,
		icons = {},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},

	log_level = vim.log.levels.INFO,
}

-- require('java').setup()
-- require('lspconfig').jdtls.setup()

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end
-- require('java').setup()
-- require('lspconfig').jdtls.setup({})

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	if server == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "yamlls" then
		local yamlls_opts = require("user.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	if server == "lua_ls" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "ts_ls" then
		local ts_ls_opts = require("user.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", ts_ls_opts, opts)
	end

	if server == "pyright" then
	  local pyright_opts = require "user.lsp.settings.pyright"
	  opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "gopls" then
	  local gopls_opts = require "user.lsp.settings.gopls"
	  opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end

	-- if server == "cssmodules_ls" then
	--   local cssmodules_ls = require "user.lsp.settings.cssmodulesls"
	--   opts = vim.tbl_deep_extend("force", cssmodules_ls, opts)
	-- end
	--
	-- if server == "tailwindcss" then
	--   local tailwindcss = require "user.lsp.settings.tailwindcss"
	--   opts = vim.tbl_deep_extend("force", tailwindcss, opts)
	-- end

	-- if server == "solc" then
	--   local solc_opts = require "user.lsp.settings.solc"
	--   opts = vim.tbl_deep_extend("force", solc_opts, opts)
	-- end

	if server == "emmet_ls" then
		local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
	end

	-- if server == "clangd" then
	--   local clang_opts = require "user.lsp.settings.clang"
	--   -- opts = vim.tbl_deep_extend("force", clang_opts, opts)
	--   local clang_status_ok, clang = pcall(require, "clangd_extensions")
	--   if not clang_status_ok then
	--     return
	--   end
	--   clang.setup(clang_opts)
	--   goto continue
	-- end

	-- if server == "zk" then
	--   local zk_opts = require "user.lsp.settings.zk"
	--   opts = vim.tbl_deep_extend("force", zk_opts, opts)
	-- end
	--
	-- if server == "jdtls" then
	-- 	goto continue
	-- end

	if server == "rust_analyzer" then
		local rust_opts = require("user.lsp.settings.rust")
		opts = vim.tbl_deep_extend("force", rust_opts, opts)
		local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
		if not rust_tools_status_ok then
      lspconfig[server].setup(opts)
      -- ::continue::
			return
		end

		rust_tools.setup(rust_opts)
	end

	lspconfig[server].setup(opts)
	::continue::
end
require('mason').setup(conf)
end

return M
