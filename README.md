# Nvim Setup

Quick Neovim setup config.

## Plugins

1. [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager for nvim
2. [catppuccin/nvim](https://github.com/catppuccin/nvim) - Coloerscheme
3. [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder for files and content within them
4. [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Handles installing, updating, and removing parsers for different languages
5. [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Plugin that manages LSP sserver, DAP server, Linters and Formatters

## Solidity specific setup

### Formatter

1. Install and set up [prettierrc solidity plugin](https://www.npmjs.com/package/prettier-plugin-solidity#configuration-file)
   ```sh
   # create npm inside project directory
   npm init -y;
   # install prettier solidity plugin
   npm i --save-dev prettier-plugin-solidity
   ```
   > [!TIP]
   >
   > ## Create a `.prettierrc` file in project direcory
   >
   > Example:
   >
   > ```json
   > // .prettierrc
   > {
   >   "plugins": ["prettier-plugin-solidity"],
   >   "overrides": [
   >     {
   >       "files": "*.sol",
   >       "options": {
   >         "parser": "solidity-parse",
   >         "printWidth": 80,
   >         "tabWidth": 4,
   >         "useTabs": false,
   >         "singleQuote": true,
   >         "bracketSpacing": true,
   >       }
   >     }
   >   ]
   > }
   > ```

## Keymaps

- File Explorer
  - leader-t
- AST treesitter selection
  - gnn - 'n' select node
  - grn - 'v' expand selection backwards
  - grm - 'v' expand selection inwards
  - grc - 'v' select tree scope
