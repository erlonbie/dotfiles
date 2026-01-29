local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_cmp_ok then
-- 	return
-- end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
-- M.capabilities.offsetEncoding = "utf-16"

M.setup = function()
	local icons = require("user.icons")
	local signs = {
    -- text = {
    --   [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
    --   [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
    --   [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
    --   [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
    -- }

		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
    virtual_lines = {
      only_current_line = true
    },
		update_in_insert = false,
		underline = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			-- width = 40,
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		-- width = 60,
		-- height = 30,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
		-- height = 30,
	})
end

local function lsp_highlight_document(client)
	-- if client.server_capabilities.document_highlight then
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end
	navic.attach(client, bufnr)
end

local function attach_navbuddy(client, bufnr)
  local status_ok, navbuddy = pcall(require, "nvim-navbuddy")
  if not status_ok then
    return
  end
  if not (client.supports_method and client.supports_method "textDocument/documentSymbol") then
    return
  end
  navbuddy.attach(client, bufnr)
end

-- local function lsp_keymaps(bufnr)
-- 	local opts = { noremap = true, silent = true }
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Trouble lsp_definitions<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", ":Trouble lsp_type_definitions<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":Trouble lsp_implementations<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Trouble lsp_references<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", ":Telescope lsp_type_definitions<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":Telescope lsp_implementations<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- 	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
-- 	-- vim.cmd([[ command! Format execute 'lua require("conform").format({ async = true, lsp_fallback = true })' ]])
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-f>", "<cmd>Format<cr>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ra", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
--
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>fa", "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>fa", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ra", "<cmd>Format<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(
-- 		bufnr,
-- 		"n",
-- 		"<leader>,",
-- 		'<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
-- 		opts
-- 	)
-- 	vim.api.nvim_buf_set_keymap(
-- 		bufnr,
-- 		"n",
-- 		"<leader>.",
-- 		'<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
-- 		opts
-- 	)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- end

M._attached = M._attached or {}

M.on_attach = function(client, bufnr)
	M._attached[bufnr] = M._attached[bufnr] or {}
	if M._attached[bufnr][client.id] then
		return
	end
	M._attached[bufnr][client.id] = true

	-- lsp_keymaps(bufnr)
	lsp_highlight_document(client)
	attach_navic(client, bufnr)
	attach_navbuddy(client, bufnr)
	if client.supports_method "textDocument/inlayHint" then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
	if client.name == "clangd" then
		-- client.resolved_capabilities.document_formatting = false
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_highlight = false
	end

end

local auto_attach_group = vim.api.nvim_create_augroup("UserAutoLspHandlers", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = auto_attach_group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end
		require("user.lsp.handlers").on_attach(client, args.buf)
	end,
})

return M

