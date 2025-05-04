return {
    -- settings = {
    -- 	typescript = {
    -- 		inlayHints = {
    -- 			includeInlayEnumMemberValueHints = true,
    -- 			includeInlayFunctionLikeReturnTypeHints = true,
    -- 			includeInlayFunctionParameterTypeHints = true,
    -- 			includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
    -- 			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    -- 			includeInlayPropertyDeclarationTypeHints = true,
    -- 			includeInlayVariableTypeHints = true,
    -- 		},
    -- 	},
    -- },
    settings = {
        typescript = {
            inlayHints = {
                -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true -- false
            }
        },
        javascript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true
            }
        },
    },


}
