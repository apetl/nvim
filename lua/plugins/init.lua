return {
  {
    "j-hui/fidget.nvim",
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
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
  },
}
