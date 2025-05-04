return {
    -- cmd = { "pyright" },
    -- settings = {
    -- 	python = {
    -- 		analysis = {
    -- 			typeCheckingMode = "basic",
    -- 			diagnosticMode = "workspace",
    -- 			inlayHints = {
    -- 				variableTypes = true,
    -- 				functionReturnTypes = true,
    -- 			},
    -- 		},
    -- 	},
    -- },
    single_file_support = true,
    settings = {
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace", -- openFilesOnly, workspace
                typeCheckingMode = "basic", -- off, basic, strict
    			inlayHints = {
    				variableTypes = true,
    				functionReturnTypes = true,
    			},
                useLibraryCodeForTypes = true
            }
        }
    },
}
