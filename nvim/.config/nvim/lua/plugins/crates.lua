vim.cmd([[
  nnoremap <silent> <leader>ctg :lua require('crates').toggle()<cr>
  nnoremap <silent> <leader>crl :lua require('crates').reload()<cr>
  nnoremap <silent> <leader>cvp :lua require('crates').show_versions_popup()<cr>
  nnoremap <silent> <leader>cfp :lua require('crates').show_features_popup()<cr>
  nnoremap <silent> <leader>cdp :lua require('crates').show_dependencies_popup()<cr>
]])

return {
	"saecki/crates.nvim",
	enable = true,
	dependecies = { "nvim-lua/plenary.nvim" },
  ft = 'toml', -- Enable only on .java file extensions
	config = function()
		require("crates").setup()
	end,
}
