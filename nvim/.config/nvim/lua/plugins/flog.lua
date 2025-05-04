local M = {
	"rbong/vim-flog",
	enabled = true,
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		"tpope/vim-fugitive",
	},
}

function M.config()
end

return M
