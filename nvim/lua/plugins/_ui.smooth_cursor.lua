return {
  {
    "gen740/SmoothCursor.nvim",
    enabled = true,
    event = "InsertEnter",
    config = function()
      require("smoothcursor").setup({
        type = "matrix",
      })
    end,
  },
}
