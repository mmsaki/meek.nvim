return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "andymass/vim-matchup",
    "andrewradev/switch.vim",
  },
  config = function()
    require("lean").setup({
      mappings = true,
      lsp = {
        init_options = {
          editDelay = 0,
          hasWidgets = true,
        },
      },
      ft = {
        nomodifiable = {},
      },
      abbreviations = {
        enable = true,
        extra = {
          wknight = "♘",
        },
        leader = "\\",
      },
      infoview = {
        autoopen = true,
        width = 50,
        height = 20,
        horizontal_position = "bottom",
        separate_tab = false,
        indicators = "auto",
      },
      progress_bars = {
        enable = true,
        character = "│",
        priority = 10,
      },
      stderr = {
        enable = true,
        height = 5,
        on_lines = nil,
      },
    })
  end,
}
