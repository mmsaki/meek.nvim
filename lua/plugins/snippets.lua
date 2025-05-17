return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    build = "make install_jsregexp",
    config = function(opts)
      local luasnip = require("luasnip")
      luasnip.setup(opts)
      require("luasnip.loaders.from_snipmate").load({ path = "./snippets" })
    end,
  },
}
