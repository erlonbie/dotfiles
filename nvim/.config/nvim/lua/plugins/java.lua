-- return {
--   "nvim-java/nvim-java",
--   enabled = true,
--   dependencies = {
--     "nvim-java/lua-async-await",
--     "nvim-java/nvim-java-core",
--     "nvim-java/nvim-java-test",
--     "nvim-java/nvim-java-dap",
--     "MunifTanjim/nui.nvim",
--     "neovim/nvim-lspconfig",
--     "mfussenegger/nvim-dap",
--
--     {
--       "williamboman/mason.nvim",
--       -- opts = {
--       --   registries = {
--       --     "github:nvim-java/mason-registry",
--       --     "github:mason-org/mason-registry",
--       --   },
--       -- },
--     },
--     {
--       "williamboman/mason-lspconfig.nvim",
--       opts = {
--         handlers = {
--           -- ["jdtls"] = function()
--           --   require("java").setup()
--           -- end,
--         },
--       },
--     },
--   }
-- }


-- return {
-- 	"nvim-java/nvim-java",
-- 	dependencies = {
-- 		"nvim-java/lua-async-await",
-- 		"nvim-java/nvim-java-core",
-- 		"nvim-java/nvim-java-test",
-- 		"nvim-java/nvim-java-dap",
-- 		"MunifTanjim/nui.nvim",
-- 		{
-- 			"neovim/nvim-lspconfig",
-- 			dependencies = { "williamboman/mason-lspconfig.nvim" },
-- 			{
-- 				"williamboman/mason-lspconfig.nvim",
--         opts = {
--           handlers = {
--             ["jdtls"] = function()
--               require("java").setup()
--             end,
--           },
--         },
-- 				dependencies = {
-- 					{
-- 						"williamboman/mason.nvim",
-- 						opts = {
-- 							registries = {
-- 								"github:nvim-java/mason-registry",
-- 								"github:mason-org/mason-registry",
-- 							},
-- 						},
-- 					},
-- 				},
-- 			},
-- 		},
-- 		"mfussenegger/nvim-dap",
-- 	},
-- }

-- return {
--   'nvim-java/nvim-java',
--   event = { "BufEnter *.java" },
--   dependencies = {
--     'nvim-java/lua-async-await',
--     'nvim-java/nvim-java-core',
--     'nvim-java/nvim-java-test',
--     'nvim-java/nvim-java-dap',
--     'MunifTanjim/nui.nvim',
--     'neovim/nvim-lspconfig',
--     'mfussenegger/nvim-dap',
--     {
--       'williamboman/mason.nvim',
--       opts = {
--         registries = {
--           'github:nvim-java/mason-registry',
--           'github:mason-org/mason-registry',
--         },
--       },
--     },
--     -- config = function()
--     --   require('java').setup()
--     -- end
--   },
-- }

-- return {'nvim-java/nvim-java'}

return {
  'nvim-java/nvim-java',
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'MunifTanjim/nui.nvim',
    "nvim-java/nvim-java-refactor",
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    {
      'williamboman/mason.nvim',
        -- registries = {
        --   'github:nvim-java/mason-registry',
        --   'github:mason-org/mason-registry',
        -- },
      },
    },
}

  -- config = function()
  --   require('java').setup()
  --   require('lspconfig').jdtls.setup({
  --     settings = {
  --       java = {
  --         configuration = {
  --           runtimes = {
  --             {
  --               name = "JavaSE-21",
  --               path = "/opt/jdk-21",
  --               default = true,
  --             }
  --           }
  --         }
  --       }
  --     }
  --   })
  -- end
  -- }

-- return { "nvim-java/nvim-java" }

-- return {
-- 	"nvim-java/nvim-java",
-- 	name = "nvim-java",
-- 	ft = "java",
-- 	-- event = "BufReadPost",
-- 	config = false,
-- 	dependencies = {
-- 		{
-- 			"neovim/nvim-lspconfig",
-- 			opts = {
-- 				servers = {
-- 					jdtls = {
-- 						-- Your custom jdtls settings go here
-- 						cmd = { "java-lsp.sh" }, -- Example: Command to start the jdtls server
-- 						root_dir = function(fname)
-- 							return require("lspconfig").util.root_pattern("pom.xml", "build.gradle", ".git")(fname)
-- 								or vim.loop.os_homedir()
-- 						end,
-- 						settings = {
-- 							java = {
-- 								format = {
-- 									enabled = true, -- Example: Enable formatting
-- 								},
-- 							},
-- 						},
-- 					},
-- 				},
-- 				setup = {
-- 					jdtls = function()
-- 						require("java").setup({
-- 							-- Your custom nvim-java configuration goes here
-- 							root_markers = {
-- 								"settings.gradle",
-- 								"settings.gradle.kts",
-- 								"pom.xml",
-- 								"build.gradle",
-- 								"mvnw",
-- 								"gradlew",
-- 								"build.gradle",
-- 								"build.gradle.kts",
-- 								".git",
-- 							},
-- 							java_test = {
-- 								enable = true,
-- 							},
-- 							java_debug_adapter = {
-- 								enable = true,
-- 							},
-- 							jdk = {
-- 								auto_install = true,
-- 							},
-- 							notifications = {
-- 								dap = true,
-- 							},
-- 							verification = {
-- 								invalid_order = true,
-- 								duplicate_setup_calls = true,
-- 								invalid_mason_registry = true,
-- 							},
-- 						})
-- 					end,
-- 				},
-- 			},
-- 		},
-- 	},
-- }
