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
				"solidity_ls",
			},
		}

		local lspconfig = require("lspconfig")
		require("lspconfig").lua_ls.setup({})
		vim.api.nvim_create_autocmd('FileType', {
			-- This handler will fire when the buffer's 'filetype' is "python"
			pattern = 'solidity',
			callback = function(args)
				vim.lsp.start({
					name = '@msaki solidity lsp server',
					-- cmd = { "vscode-solidity-server", "--stdio" },
					cmd = { "nc", "localhost", "65432" }, -- NOTE: should be started manually

					-- Set the "root directory" to the parent directory of the file in the
					-- current buffer (`args.buf`) that contains either a "setup.py" or a
					-- "pyproject.toml" file. Files that share a root directory will reuse
					-- the connection to the same LSP server.
					root_dir = vim.fs.root(args.buf, { 'foundry.toml', '.git' }),
		 			settings = {
		 				wake = {
		 					configuration = {
		 						use_toml_if_present = true,
		 						toml_path = "wake.toml",
		 					},
		 					lsp = {
		 						compilation_delay = 0,
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
		 			}
				})
		 	end,
		})
		-- on lsp attach
		-- vim.api.nvim_create_autocmd('LspAttach', {
		-- 	callback = function(args)
		-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- 		if client.supports_method('textDocument/implementation') then
		-- 			-- Create a keymap for vim.lsp.buf.implementation
		-- 		end

		-- 		if client.supports_method('textDocument/completion') then
		-- 			-- Enable auto-completion
		-- 			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		-- 		end

		-- 		if client.supports_method('textDocument/formatting') then
		-- 			-- Format the current buffer on save
		-- 			vim.api.nvim_create_autocmd('BufWritePre', {
		-- 				buffer = args.buf,
		-- 				callback = function()
		-- 					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
		-- 				end,
		-- 			})
		-- 		end
		-- 	end,
		-- })
		--		require("lspconfig").solidity_ls.setup {
		--			cmd = { "vscode-solidity-server", "--stdio" },
		--			filetypes = { "solidity" },
		--			single_file_support = true,
		--		}
		--	require("lspconfig.configs").wake = {
		--		default_config = {
		--			cmd = { "wake", "lsp" }, -- NOTE: should be started manually
		--			filetypes = { "solidity" },
		--			root_dir = lspconfig.util.root_pattern("foundry.toml"),
		--			settings = {
		--				wake = {
		--					configuration = {
		--						use_toml_if_present = true,
		--						toml_path = "wake.toml",
		--					},
		--					lsp = {
		--						compilation_delay = 15,
		--						find_references = {
		--							include_declarations = true,
		--						},
		--						code_lens = {
		--							enable = false,
		--						},
		--						detectors = {
		--							only = {},
		--						},
		--					},
		--				},
		--			},
		--		},
		--	}
	end,
}
