return {
  "epwalsh/obsidian.nvim",
  event = (function()
    local is_wsl = vim.fn.has("wsl") == 1
    local vault_path = is_wsl and "/mnt/c/Users/petli/Obsidian" or "C:/Users/petli/Obsidian"

    return { "BufReadPre " .. vault_path:gsub("/", "\\") .. "\\**.md" }
  end)(),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
  },
  opts = (function()
    local is_wsl = vim.fn.has("wsl") == 1
    return {
      dir = is_wsl and "/mnt/c/Users/petli/Obsidian" -- WSL path format
        or "C:/Users/petli/Obsidian", -- Windows path format
      weekly_notes = {
        folder = "Scratchpad",
        date_format = "📌%Y-W%V",
      },
      ui = { enable = false },
      disable_frontmatter = true,
    }
  end)(),
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}
