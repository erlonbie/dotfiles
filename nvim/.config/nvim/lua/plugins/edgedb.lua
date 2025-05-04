local M = {
	"edgedb/edgedb-vim",
	enabled = true,
	event = { "BufReadPre *.esdl", "BufNewFile *.esdl" },
}

return M
