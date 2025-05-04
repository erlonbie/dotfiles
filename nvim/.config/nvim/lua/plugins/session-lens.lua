local M = {
	"rmagatti/session-lens",
	event = "VeryLazy",
	-- event = "VimEnter"
	dependencies = {
	"rmagatti/auto-session",
		'nvim-lua/plenary.nvim',
	}
}

function M.config()
	local status_ok, session_lens = pcall(require, "session-lens")
	if not status_ok then
		return
	end

	session_lens.setup({
		path_display = { "shorten" },
		-- theme_conf = { border = false },
		previewer = true,
	})
end

return M
