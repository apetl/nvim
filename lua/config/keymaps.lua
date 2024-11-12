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
-- vim.api.nvim_set_keymap("n", "i", "k", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "j", "h", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "k", "j", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "l", "l", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("v", "i", "k", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "j", "h", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "k", "j", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "l", "l", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("o", "i", "k", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("o", "j", "h", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("o", "k", "j", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("o", "l", "l", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", ";", "i", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<S-j>", ":bprevious<CR>", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<C-i>", "<C-w>k", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>h", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>j", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
