return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    { "folke/neoconf.nvim" },
    {
      "creativenull/efmls-configs-nvim",
      version = "v1.x.x",
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    require("neoconf").setup({})
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

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
        "ruff",
        "pyright",
        "html",
        "cssls",
        "tailwindcss",
        "solidity_ls_nomicfoundation",
        "biome",
        "dockerls",
        "remark_ls",
      },
    })
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.tailwindcss.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    lspconfig.ruff.setup({ capabilities = capabilities })
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.biome.setup({ capabilities = capabilities })
    lspconfig.remark_ls.setup({ capabilities = capabilities })
    lspconfig.dockerls.setup({ capabilities = capabilities })
    lspconfig.solidity_ls_nomicfoundation.setup({ capabilities = capabilities })
    lspconfig.sourcekit.setup({
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    })
    local languages = {
      javascript = {
        require("efmls-configs.linters.eslint"),
        require("efmls-configs.formatters.prettier_d"),
      },
      javascriptreact = {
        require("efmls-configs.linters.eslint"),
        require("efmls-configs.formatters.prettier_d"),
      },
      typescript = {
        require("efmls-configs.linters.eslint"),
        require("efmls-configs.formatters.prettier_d"),
      },
      typescriptreact = {
        require("efmls-configs.linters.eslint"),
        require("efmls-configs.formatters.prettier_d"),
      },
      solidity = {
        require("efmls-configs.linters.solhint"),
        require("efmls-configs.formatters.forge_fmt"),
      },
      lua = {
        require("efmls-configs.formatters.stylua"),
      },
      python = {
        require("efmls-configs.linters.ruff"),
        require("efmls-configs.formatters.ruff"),
      },
      rust = {
        require("efmls-configs.formatters.rustfmt"),
      },
      dockerfile = {
        require("efmls-configs.linters.hadolint"),
      },
      json = {
        require("efmls-configs.linters.jq"),
        require("efmls-configs.formatters.jq"),
      },
      markdown = {
        require("efmls-configs.linters.markdownlint"),
        require("efmls-configs.formatters.mdformat"),
      },
    }
    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { ".git/" },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        completion = true,
        codeAction = true,
        documentSymbol = true,
      },
    }
    lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {
      capabilities = capabilities,
    }))
  end,
}
