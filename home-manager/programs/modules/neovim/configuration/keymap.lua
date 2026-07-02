vim.g.mapleader = " "

vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Сам почему-то не заводитя
vim.keymap.set("n", "<leader>ll", ":lua vim.lsp.enable('lua-ls')<CR>")
