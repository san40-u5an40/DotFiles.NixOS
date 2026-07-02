vim.g.mapleader = " "

vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("n", "<C-Tab>", ":bd<CR>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Сам почему-то не заводитя
vim.keymap.set("n", "<leader>ll", ":lua vim.lsp.enable('lua-ls')<CR>")
