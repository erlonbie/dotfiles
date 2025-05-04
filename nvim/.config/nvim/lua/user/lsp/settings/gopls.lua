return {
    settings = {
        gopls = {
            ["ui.inlayhint.hints"] = {
              compositeLiteralFields = true,
              constantValues = true,
              parameterNames = true,
              assignVariableTypes = true,
              compositeLiteralTypes = true,
              functionTypeParameters = true,
              rangeVariableTypes = true
            },
        }
    },
}
