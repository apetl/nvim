-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Add this to your key mappings

vim.api.nvim_set_keymap(
  "n",
  "<leader>uh",
  ':lua require("lsp-inlayhints").toggle()<CR>',
  { noremap = true, silent = true }
)

-- Map new movement keys
vim.api.nvim_set_keymap("n", "i", "k", { noremap = true, silent = true }) -- i goes up
vim.api.nvim_set_keymap("n", "j", "h", { noremap = true, silent = true }) -- j goes left
vim.api.nvim_set_keymap("n", "k", "j", { noremap = true, silent = true }) -- k goes down
vim.api.nvim_set_keymap("n", "l", "l", { noremap = true, silent = true }) -- l goes right

vim.api.nvim_set_keymap("n", ";", "i", { noremap = true, silent = true })
