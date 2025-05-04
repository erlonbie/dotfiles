local M = {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'nvim-java/nvim-java',
      { 'j-hui/fidget.nvim', opts = {
            notification = {
            filter = vim.log.levels.INFO, -- M
          }
        }
      },

      -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
          },
        },
      },
      { 'Bilal2453/luvit-meta', lazy = true },
    },
}

function M.config()
	local status_ok, _ = pcall(require, "lspconfig")
	if not status_ok then
		return
	end

  -- https://cmp.saghen.dev/configuration/appearance
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#A58C5F" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#907BB1" })
  -- vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#F64D00" })
  vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#574D6C" })
  -- vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { fg = "#ffd666" })
  -- vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#ffd666" })
  -- vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { fg = "#ffd666" })
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#C8C093" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#39394A" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = "#76946A" })


	M.server_capabilities = function()
		local active_clients = vim.lsp.get_clients()
		local active_client_map = {}
    local capabilities = require('blink.cmp').get_lsp_capabilities() -- disable for cmp

		for index, value in ipairs(active_clients) do
			active_client_map[value.name] = index
		end

		vim.ui.select(vim.tbl_keys(active_client_map), {
			prompt = "Select client:",
			format_item = function(item)
				return "capabilities for: " .. item
			end,
		}, function(choice)
			local client_name = choice
			local client_capabilities = vim.lsp.get_clients()[active_client_map[client_name]].server_capabilities
			local combined_capabilities = vim.tbl_deep_extend("force", client_capabilities, capabilities) -- disable for cmp
			vim.pretty_print(combined_capabilities) -- disable for cmp
		end)
	end

	require("user.lsp.lsp-signature")
	require("user.lsp.handlers").setup()

	local servers = {
		jsonls = require "user.lsp.settings.jsonls",
		yamlls = require "user.lsp.settings.yamlls",
		lua_ls = require "user.lsp.settings.sumneko_lua",
		ts_ls = require "user.lsp.settings.tsserver",
		basedpyright = {
			settings = {
				disableOrganizeImports = true,
				basedpyright = {
					analysis = {
						diagnosticMode = 'workspace',
						typeCheckingMode = 'standard',
						useLibraryCodeForTypes = true,
					},
				},
			},
		},
		gopls = require "user.lsp.settings.gopls",
		emmet_ls = require "user.lsp.settings.emmet_ls",
		rust_analyzer = require "user.lsp.settings.rust",
  -- rust_analyzer = require('mason-lspconfig').setup_handlers {
  --   ['rust_analyzer'] = function() end,
  -- },
		clangd = require "user.lsp.settings.clang",
	}

	require("mason").setup()
	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua",
	})

	local lint_and_formatters = {
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
		"cpplint",
		-- "ruff",
		"goimports",
		"gofumpt",
		-- "eslint_d",
		"phpstan",
		"tflint",
		"golangci-lint",
		"gomodifytags",
		-- "rustywind",
		"prettierd",
		"jsonlint",
		"proselint",
		"phpcs"
	}
	require("mason-tool-installer").setup({ ensure_installed = lint_and_formatters })

	require("mason-lspconfig").setup {
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities) -- disable for cmp
				require("lspconfig")[server_name].setup(server)
			end,
			jdtls = function()
				require("java").setup {}
				require("lspconfig").jdtls.setup {}
			end,
		},
	}
end

return M
