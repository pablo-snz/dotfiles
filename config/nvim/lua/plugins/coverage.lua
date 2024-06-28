return {
  "andythigpen/nvim-coverage",
  requires = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("coverage").setup()
  end,
  keys = {
    {
      "<leader>cs",
      function()
        require("coverage").load("coverage.xml")
      end,
      desc = "Show coverage",
    },
    {
      "<leader>ct",
      function()
        require("coverage").toggle()
      end,
      desc = "Toggle coverage",
    },
  },
}
