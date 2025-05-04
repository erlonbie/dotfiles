return {
	"kevinhwang91/nvim-bqf",
  event = "VeryLazy",
	opts = {
		auto_enable = true,
		magic_window = true,
		auto_resize_height = false,
		preview = {
			auto_preview = true,
			show_title = true,
			delay_syntax = 50,
			wrap = false,
		},
		func_map = {
			split = "s",
			openc = "<CR>",
			vsplit = "v",
			stoggleup = "M",
			stoggledown = "m",
			stogglevm = "m",
			filterr = "f",
			filter = "F",
		},
	},
}
