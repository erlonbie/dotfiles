return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"
    conform.setup {
      formatters_by_ft = {
        ["*"] = { "trim_whitespace", "trim_newlines" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        -- python = { "isort", "black" },
        -- python = {  "ruff_format", "ruff_fix", "ruff_organize_imports" },
        python = { "ruff_format", "isort" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        shell = { "shfmt" },
        java = { "google-java-format" },
        -- c = { "clang-format" },
        -- cpp = { "clang-format" },
        xml = { "xmlformatter" },

        php = { "php-cs-fixer" },
        toml = { "taplo" },
        zsh = { "beautysh" },
        go = { "gofmt" },
      },
      formatters = {
        java = {
          command = "google-java-format",
          args = { "-" },
        },
        c = {
          meta = {
            url = "https://www.kernel.org/doc/html/latest/process/clang-format.html",
            description = "Tool to format C/C++/… code according to a set of rules and heuristics.",
          },
          command = "clang-format",
          args = { "-assume-filename", "$FILENAME" },
          range_args = function(ctx)
            local start_offset, end_offset = util.get_offsets_from_range(ctx.buf, ctx.range)
            local length = end_offset - start_offset
            return {
              "-assume-filename",
              "$FILENAME",
              "--offset",
              tostring(start_offset),
              "--length",
              tostring(length),
            }
          end,
        },
        cpp = {
          meta = {
            url = "https://www.kernel.org/doc/html/latest/process/clang-format.html",
            description = "Tool to format C/C++/… code according to a set of rules and heuristics.",
          },
          command = "clang-format",
          args = { "-assume-filename", "$FILENAME" },
          range_args = function(ctx)
            local start_offset, end_offset = util.get_offsets_from_range(ctx.buf, ctx.range)
            local length = end_offset - start_offset
            return {
              "-assume-filename",
              "$FILENAME",
              "--offset",
              tostring(start_offset),
              "--length",
              tostring(length),
            }
          end,
        },
        php = {
          meta = {
            url = "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer",
            description = "The PHP Coding Standards Fixer.",
          },
          command = "php-cs-fixer",
          -- command = util.find_executable({
          --     "tools/php-cs-fixer/vendor/bin/php-cs-fixer",
          --     "vendor/bin/php-cs-fixer",
          -- }, "php-cs-fixer"),
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
      },
      -- format_on_save = {
      --     lsp_fallback = "always",
      --     async = false,
      --     timeout_ms = 500
      -- }
    }
    vim.keymap.set({ "n", "v" }, "<leader>fa", function()
      conform.format {
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      }
    end, { desc = "Format file in normal or visual mode (range)" })
  end,
}
