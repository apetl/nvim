-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guicursor = { "sm:block,n-v-c:ver25,i-ci-ve:ver25-blinkwait100-blinkon100-blinkoff100,r-cr-o:hor20" }
vim.cmd([[highlight CursorLine ctermbg=NONE guibg=NONE]])

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 1,
  }
end

-- Toggle line length limit to 80 characters
vim.keymap.set("n", "uW", function()
  if vim.o.textwidth == 80 then
    vim.o.textwidth = 0 -- Disable line length limit
    print("Line length limit disabled")
  else
    vim.o.textwidth = 80 -- Enable line length limit at 80 characters
    print("Line length limited to 80 characters")
  end
end, { desc = "Toggle line length limit to 80 characters" })

