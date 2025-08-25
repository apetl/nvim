return {
  "epwalsh/obsidian.nvim",
  event = (function()
    -- AUTO-CONVERT PATH FOR WSL
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

    local fzf_lua = pcall(require, "fzf-lua") and require("fzf-lua") or nil
    if fzf_lua then
      -- Use platform-agnostic path separator
      local vault_dir = opts.dir:gsub("\\", "/")
      local weekly_dir = vault_dir .. "/" .. opts.weekly_notes.folder

      vim.keymap.set("n", "<leader>oo", function()
        fzf_lua.files({ cwd = vault_dir })
      end, { desc = "Search Obsidian Notes" })

      vim.keymap.set("n", "<leader>ow", function()
        fzf_lua.files({ cwd = weekly_dir })
      end, { desc = "Search Weekly Notes" })
    end
  end,
}
