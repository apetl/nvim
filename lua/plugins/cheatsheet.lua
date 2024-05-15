return {
  "sudormrfbin/cheatsheet.nvim",
  cmd = "Cheatsheet",
  keys = {
    { "<leader>ch", "<cmd>Cheatsheet<cr>", desc = "Open Cheatsheet" },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("cheatsheet").setup({
      -- Your configuration here
    })
  end,
}
