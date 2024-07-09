return {
  {
    "j-hui/fidget.nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "mfussenegger/nvim-dap", cmd = "DapToggleBreakpoint" },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", cmd = "Mason", build = ":MasonUpdate" },
    },
  },
}
