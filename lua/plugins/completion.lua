return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    version = false,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "zbirenbaum/copilot.lua",
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })

      require("copilot_cmp").setup({})

      require("custom.completion")
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local opts = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        mapping = cmp.mapping.preset.insert({
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<tab>"] = cmp.mapping(function(original)
            print("tab pressed")
            if cmp.visible() then
              print("cmp expand")
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              print("snippet expand")
              luasnip.expand_or_jump()
            else
              print("fallback")
              original()
            end
          end, { "i", "s" }),
          ["<S-tab>"] = cmp.mapping(function(original)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.jump(-1)
            else
              original()
            end
          end, { "i", "s" }),
        }),
        snippets = {
          expand = function(args)
            luasnip.lsp_expand(args)
          end,
        },
      })
      cmp.setup(opts)
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
}
