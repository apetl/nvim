return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = false,
      },
    })
  end,
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add file to harpoon",
    },
    {
      "<leader>hr",
      function()
        require("harpoon.mark").rm_file()
      end,
      desc = "Remove file from harpoon",
    },
    {
      "<C-e>",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Toggle quick menu",
    },
    {
      "<leader>h]",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Go to next harpoon mark",
    },
    {
      "<leader>h[",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Go to previous harpoon mark",
    },
  },
}
