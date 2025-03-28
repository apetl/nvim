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