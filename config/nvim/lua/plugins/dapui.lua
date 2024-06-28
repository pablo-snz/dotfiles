return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function()
      require("dapui").eval()
      require("dap.ui.widgets").hover()
    end, desc = "Eval", mode = {"n", "v"} },
  },
}
