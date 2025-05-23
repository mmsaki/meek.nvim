# Nvim Setup

Quick Neovim setup config.

## Plugins

1. autocompletion.lua
1. autoformat.lua
1. autopairs.lua
1. blink.lua
1. catpuccin.lua
1. dadbod.lua
1. debug.lua
1. fugitive.lua
1. git-signs.lua
1. harpoon.lua
1. illumunate.lua
1. image.lua
1. jupyter.lua
1. lean.lua
1. lsp-config.lua
1. lspsaga.lua
1. lualine.lua
1. markdown.lua
1. nvim-tree.lua
1. snippets.lua
1. telescope.lua
1. todo.lua
1. transparent.lua
1. treesitter.lua
1. which-key.lua

## LSP, Linters and Formatters

- Using efm-config

```lua
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
```
