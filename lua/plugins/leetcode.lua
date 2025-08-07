return {
  "kawre/leetcode.nvim",
  lazy = true,
  cmd = { "Leet" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    picker = {
      provider = nil,
    },
  },
  config = function(_, opts)
    require("leetcode").setup(opts)
  end,
}
