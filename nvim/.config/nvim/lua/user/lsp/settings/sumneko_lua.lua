-- https://luals.github.io/wiki/settings/
return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim", "spec" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      hint = {
        enable = true,
        arrayIndex = "Auto", -- "Enable" | "Auto" | "Disable"
        await = true,
        paramName = "All", -- "All" | "Literal" | "Disable"
        paramType = true,
        semicolon = "All", -- "All" | "SameLine" | "Disable"
        setType = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- return {
-- 	settings = {
-- 		Lua = {
-- 			type = {
-- 				-- weakUnionCheck = true,
-- 				-- weakNilCheck = true,
-- 				-- castNumberToInteger = true,
-- 			},
-- 			format = {
-- 				enable = true,
-- 			},
-- 			hint = {
-- 				enable = true,
-- 				arrayIndex = "False", -- "Enable", "Auto", "Disable"
-- 				await = true,
-- 				paramName = "Enable", -- "All", "Literal", "Disable"
-- 				paramType = false,
-- 				semicolon = "Enable", -- "All", "SameLine", "Disable"
-- 				setType = true,
-- 			},
-- 			-- spell = {"the"}
-- 			runtime = {
-- 				version = "LuaJIT",
-- 				special = {
-- 					reload = "require",
-- 				},
-- 			},
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 					-- [vim.fn.datapath "config" .. "/lua"] = true,
-- 				},
-- 			},
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- }
