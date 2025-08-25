return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  opts = (function()
    -- AUTO-DETECT WSL FOR PATH-HANDLING PLUGINS
    local is_wsl = vim.fn.has("wsl") == 1

    -- CRITICAL: Force consistent path handling for link resolution
    if is_wsl then
      -- Fix for WSL: Ensure all paths use /mnt/c format
      vim.opt.path:append("/mnt/c/**")
      vim.opt.suffixesadd:append(".md")
    end

    return {
      bullet = { enabled = true },
      checkbox = {
        enabled = true,
        position = "inline",
        unchecked = {
          icon = " 󰄱",
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          icon = " 󰱒",
          highlight = "RenderMarkdownChecked",
        },
      },
      html = { enabled = true, comment = { conceal = false } },
      heading = {
        sign = true,
        icons = { " 󰇊 ", " 󰇋 ", " 󰇌 ", " 󰇍 ", " 󰇎 ", " 󰇏 " },
        position = "inline",
      },
    }
  end)(),
  config = function(_, opts)
    require("render-markdown").setup(opts)

    if vim.fn.has("wsl") == 1 then
      local function patch_link_handler()
        -- Override the default link handler to convert Windows paths
        local orig_handler = require("obsidian").util.go_to_file
        if not orig_handler then
          return
        end

        require("obsidian").util.go_to_file = function(path)
          local wsl_path = path
            :gsub("^([A-Z]):", function(d)
              return "/mnt/" .. d:lower()
            end)
            :gsub("\\", "/")
          return orig_handler(wsl_path)
        end
      end

      -- Apply patch only if obsidian.nvim is loaded
      pcall(patch_link_handler)
    end
  end,
}
