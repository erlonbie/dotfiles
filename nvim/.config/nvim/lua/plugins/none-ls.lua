-- return {
-- 	"nvimtools/none-ls.nvim",
-- 	enabled = true,
-- 	config = function()
-- 		local null_ls = require("null-ls")
--
-- 		null_ls.setup({
-- 			sources = {
-- 				null_ls.builtins.formatting.stylua,
-- 				null_ls.builtins.diagnostics.eslint_d,
-- 				-- null_ls.builtins.diagnostics.flake8,
-- 				null_ls.builtins.diagnostics.ruff,
-- 				-- null_ls.builtins.diagnostics.klint,
-- 				null_ls.builtins.diagnostics.shellcheck,
-- 				null_ls.builtins.diagnostics.cpplint,
-- 				null_ls.builtins.diagnostics.phpstan,
-- 				null_ls.builtins.diagnostics.checkstyle,
-- 				null_ls.builtins.formatting.google_java_format,
-- 				null_ls.builtins.formatting.shfmt,
-- 				null_ls.builtins.formatting.xmlformat,
-- 				null_ls.builtins.formatting.taplo,
-- 				null_ls.builtins.formatting.beautysh,
-- 				null_ls.builtins.diagnostics.phpcs,
-- 				null_ls.builtins.formatting.isort,
-- 				null_ls.builtins.formatting.black,
-- 				null_ls.builtins.formatting.prettier.with({
-- 					extra_filetypes = { "toml", "solidity" },
-- 					extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
-- 				}),
-- 				-- null_ls.builtins.completion.spell,
-- 			},
-- 		})
--
-- 		vim.keymap.set("v", "<leader>fa", "<cmd>lua vim.lsp.buf.format()<CR>", {})
-- 		vim.keymap.set("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format()<CR>", {})
-- 	end
-- }

local config = function()
	local null_ls = require("null-ls")

	local ca = null_ls.builtins.code_actions
	local d = null_ls.builtins.diagnostics
	local f = null_ls.builtins.formatting
	local md_ft = { filetypes = { "markdown", "vimwiki" } }
	local prettier_ft = {
		filetypes = {
			"css",
			"html",
			"javascript",
			"json",
			"jsonc",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"vue",
		},
		disabled_filetypes = { "lua", "yaml" },
	}
	local rustywind_ft = {
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"typescriptreact",
			"vue",
		},
	}
	local cs_ignore = {
		extra_args = { "--ignore-words=~/.config/codespell/ignore_words" },
	}

	local sources = {
		-- ca.eslint_d,
		ca.refactoring,
		ca.shellcheck,
		ca.gomodifytags,
		ca.gitsigns,
		-- d.clang_check, -- use clangd
		-- d.eslint_d,
		d.fish,
		d.hadolint,
		d.jsonlint,
		d.markdownlint.with(md_ft),
		d.shellcheck,
		d.cpplint,
		d.phpstan,
		-- d.checkstyle,
		-- d.phpcs,
		d.tsc,
		-- f.ruff,
		f.google_java_format,
		f.beautysh,
		f.xmlformat,
		-- f.taplo,
		-- f.black,
		-- f.black.with({extra_args = {"--fast", "--line-ranges"}}),
		f.cbfmt.with(md_ft),
		f.markdownlint.with(md_ft),
		-- f.prettierd.with(prettier_ft),
    f.prettier.with({
      extra_filetypes = { "toml", "solidity" },
      -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      extra_args = { "--single-quote", "--jsx-single-quote", "bracket_spacing = true" },
    }),
		-- f.rustywind.with(rustywind_ft),
		f.stylua.with({ filetypes = { "lua" } }),
		f.yamlfmt.with({ filetypes = { "yaml" } }),
		f.clang_format.with({ filetypes = { "c", "cpp", "objc", "objcpp" } }),
		f.fish_indent,
		f.fixjson,
		f.isort,
		f.shellharden,
		f.erb_format,
		f.rustfmt,
    f.goimports,
    f.gofumpt,
		-- ca.proselint,
		-- ca.impl,
		-- d.codespell.with(cs_ignore),
		-- d.misspell,
		-- f.autopep8,
		-- f.codespell.with(cs_ignore),
		-- f.reorder_python_imports,
	}

	null_ls.setup({
		sources = sources,
		should_attach = function(bufnr)
			return not vim.api.nvim_buf_get_name(bufnr):match(".env$")
		end,
		on_init = function(new_client, _)
			new_client.offset_encoding = "utf-16"
		end,
		temp_dir = "/tmp",
	})

	vim.keymap.set("v", "<leader>fa", "<cmd>lua vim.lsp.buf.format()<CR>", {})
	vim.keymap.set("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format()<CR>", {})
end

return {
	"nvimtools/none-ls.nvim",
	config = config,
	event = "BufReadPre",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim"

	}
}
