return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"ruff",
				"pyright",
				"html",
				"cssls",
				"tailwindcss",
			},
		}

		local lspconfig = require("lspconfig")
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").solidity_ls.setup {
			cmd = { "vscode-solidity-server", "--stdio" },
			filetypes = { "solidity" },
			single_file_support = true,
		}
		require("lspconfig.configs").wake = {
			default_config = {
				cmd = { "nc", "localhost", "65432" }, -- NOTE: should be started manually
				filetypes = { "solidity" },
				root_dir = lspconfig.util.root_pattern("foundry.toml"),
				settings = {
					wake = {
						configuration = {
							use_toml_if_present = true,
							toml_path = "wake.toml",
						},
						lsp = {
							compilation_delay = 15,
							find_references = {
								include_declarations = true,
							},
							code_lens = {
								enable = false,
							},
							detectors = {
								only = {},
							},
						},
					},
				},
			},
		}
	end,
}
