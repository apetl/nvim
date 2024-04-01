-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guicursor = { "sm:block,n-v-c:ver25,i-ci-ve:ver25-blinkwait100-blinkon100-blinkoff100,r-cr-o:hor20" }
vim.cmd([[highlight CursorLine ctermbg=NONE guibg=NONE]])
