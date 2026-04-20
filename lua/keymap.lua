vim.keymap.set("n", "<leader>e", "<Cmd>Explore<CR>")

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader><leader>", fzf.files)
vim.keymap.set("n", "<leader>b", fzf.buffers)
vim.keymap.set("n", "<leader>/", fzf.live_grep)


vim.keymap.set('n', 'ciw', '"_ciw', { noremap = true })
vim.keymap.set('n', 'caw', '"_caw', { noremap = true })
