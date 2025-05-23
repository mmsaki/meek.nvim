return {
  "rockyzhang24/vim-illuminate",
  branch = "fix-encoding",
  lazy = true,
  event = "BufReadPost",
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
