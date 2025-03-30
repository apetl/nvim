return {
  "epwalsh/obsidian.nvim", -- The obsidian.nvim plugin
  event = { "BufReadPre C:/Users/petli/Obsidian/**.md" }, -- Load only for Obsidian notes
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency
    "ibhagwan/fzf-lua", -- Optional: for fzf-lua integration
  },
  opts = {
    dir = "C:/Users/petli/Obsidian", -- Path to your Obsidian vault
    weekly_notes = {
      folder = "Scratchpad", -- Folder for weekly notes
      date_format = "📌%Y-W%V", -- Weekly note naming format
    },
    ui = { enable = false },
    disable_frontmatter = true,
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Optional: Set up fzf-lua integration
    local fzf_lua = require("fzf-lua")
    if fzf_lua then
      vim.keymap.set("n", "<leader>oo", function()
        fzf_lua.files({ cwd = opts.dir }) -- Open fzf-lua in the Obsidian vault
      end, { desc = "Search Obsidian Notes" })

      vim.keymap.set("n", "<leader>ow", function()
        fzf_lua.files({ cwd = opts.dir .. "\\" .. opts.weekly_notes.folder }) -- Search weekly notes
      end, { desc = "Search Weekly Notes" })
    end
  end,
}
