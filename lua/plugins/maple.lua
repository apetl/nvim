return {
  "forest-nvim/maple.nvim",
  keys = {
    { "<leader>mt", "<cmd>MapleToggle<CR>", desc = "Toggle Maple Notes" },
    { "<leader>ms", "<cmd>MapleSwitchMode<CR>", desc = "Switch notes mode" },
    { "<leader>mc", "<cmd>MapleToggleCheckbox<CR>", desc = "Toggle checkbox" },
    { "<leader>ma", "<cmd>MapleAddCheckbox<CR>", desc = "Add checkbox" },
    { "<leader>mf", "<cmd>MapleSearch<CR>", desc = "Search notes" },
    { "<leader>mg", "<cmd>MapleSearch grep<CR>", desc = "Grep notes" },
  },
  opts = {
    width = 0.8,
    height = 0.8,
    border = "rounded",
    title = " maple ",
    title_pos = "center",
    winblend = 0,
    show_legend = false,
    storage_path = vim.fn.stdpath("data") .. "/maple",
    notes_mode = "global",
    keymaps = {
      close = "q",
      switch_mode = "m",
    },
  },
}
