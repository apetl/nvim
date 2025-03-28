return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")

    local keys = {
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Add file to harpoon",
      },
      {
        "<leader>hr",
        function()
          harpoon:list():remove()
        end,
        desc = "Remove file from harpoon",
      },
      {
        "<C-h>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Toggle quick menu",
      },
      {
        "<leader>h]",
        function()
          harpoon:list():next()
        end,
        desc = "Go to next harpoon mark",
      },
      {
        "<leader>h[",
        function()
          harpoon:list():prev()
        end,
        desc = "Go to previous harpoon mark",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    return keys
  end,
}
