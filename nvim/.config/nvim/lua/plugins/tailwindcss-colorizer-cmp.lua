return {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    enabled = true,
    -- optionally, override the default options:
    config = function()
        require("tailwindcss-colorizer-cmp").setup({
            color_square_width = 2,
        })
        require("cmp").config.formatting = {
            format = require("tailwindcss-colorizer-cmp").formatter,
        }
    end
}
