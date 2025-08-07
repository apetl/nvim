return {
  "forest-nvim/maple.nvim",
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
    --use_project_specific_notes = true,
    keymaps = {
      toggle = "<leader>m",
      close = "q",
      switch_mode = "m",
    },
  },
}
