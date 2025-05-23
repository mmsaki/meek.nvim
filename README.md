# Nvim Setup

Quick Neovim setup config.

## Plugins

01. autocompletion - 'hrsh7th/nvim-cmp'
02. autoformat - 'stevearc/conform.nvim'
03. autopairs - 'windwp/nvim-autopairs'
04. blink - "saghen/blink.cmp"
05. colorscheme - "catppuccin/nvim"
06. dadbod - "tpope/vim-dadbod"
07. debug - 'mfussenegger/nvim-dap'
08. fugitive - "tpope/vim-fugitive"
09. git-signs - "lewis6991/gitsigns.nvim"
10. harpoon - "ThePrimeagen/harpoon"
11. illumunate - "rockyzhang24/vim-illuminate"
12. image - "3rd/image.nvim"
13. jupyter - "benlubas/molten-nvim"
14. lean - "Julian/lean.nvim"
15. lsp-config - "williamboman/mason-lspconfig.nvim"
16. lspsaga - "glepnir/lspsaga.nvim"
17. lualine - 'nvim-lualine/lualine.nvim'
18. markdown - 'MeanderingProgrammer/render-markdown.nvim'
19. nvim-tree - "nvim-tree/nvim-tree.lua"
20. snippets - "L3MON4D3/LuaSnip"
21. telescope - "nvim-telescope/telescope.nvim"
22. todo - 'folke/todo-comments.nvim'
23. transparent - "xiyaowong/transparent.nvim"
24. treesitter - "nvim-treesitter/nvim-treesitter"
25. which-key - "folke/which-key.nvim"

## LSP, Linters and Formatters

- Using efm-config

```lua
local languages = {
  javascript = {
    require("efmls-configs.linters.eslint_d"),
    require("efmls-configs.formatters.prettier_d"),
  },
  javascriptreact = {
    require("efmls-configs.linters.eslint_d"),
    require("efmls-configs.formatters.prettier_d"),
  },
  typescript = {
    require("efmls-configs.linters.eslint_d"),
    require("efmls-configs.formatters.prettier_d"),
  },
  typescriptreact = {
    require("efmls-configs.linters.eslint_d"),
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
```
