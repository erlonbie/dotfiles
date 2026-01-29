return {
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPre",
    config = function()
      require("lint").linters_by_ft = {
        python = { "ruff" },
        htmldjango = { "djlint" },
        -- javascript = { "eslint_d" },
        -- typescript = { "eslint_d" },
        -- c = { "clangtidy" },
        cpp = { "cpplint" },
        cmake = { "cmakelint" },
        go = { "golangcilint" },
        -- markdown = { "vale" },
        -- yaml = { "yamllint" },
        bash = { "shellcheck" },
        -- lua = { "luacheck" },
      }
      vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
        callback = function()
          local lint_status, lint = pcall(require, "lint")
          if lint_status then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
