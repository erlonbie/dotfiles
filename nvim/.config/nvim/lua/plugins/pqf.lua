-- Quickfixtextfunc function and syntax rules for quickfix/location list buffers.
return {
  {
    'yorickpeterse/nvim-pqf',
    enabled = true,
    event = 'VeryLazy',
    opts = {
      show_multiple_lines = true,
      max_filename_length = 40,
    },
  },
}
