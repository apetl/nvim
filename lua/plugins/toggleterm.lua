return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local powershell_options = {
      shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
      shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      shellquote = "",
      shellxquote = "",
    }

    require("toggleterm").setup({
      -- Terminal settings
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
        return 20
      end,
      open_mapping = [[<A-\>]],
      hide_numbers = true,
      shade_terminals = false,
      start_in_insert = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,

      -- Enhanced float settings
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        title_pos = "center",
      },

      -- Windows-specific settings with proper PowerShell configuration
      shell = vim.loop.os_uname().sysname == "Windows_NT" and powershell_options.shell or "bash",

      -- Terminal window mappings
      on_open = function(term)
        vim.cmd("startinsert!")
        -- Terminal mode mappings
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true })
        -- Clear terminal with Ctrl+L in terminal mode
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", "<C-l>", { noremap = true })
        -- Window navigation in normal mode
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-h>", [[<C-W>h]], { noremap = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-j>", [[<C-W>j]], { noremap = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-k>", [[<C-W>k]], { noremap = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-l>", [[<C-W>l]], { noremap = true })
      end,
    })

    -- Apply PowerShell options on Windows
    if vim.loop.os_uname().sysname == "Windows_NT" then
      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end
    end
  end,
}
