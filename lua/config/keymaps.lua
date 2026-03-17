local map = vim.keymap.set
-- Imposta INVIO come leader
vim.g.mapleader = "\13"
vim.g.maplocalleader = "\13"

-- Disabilita la funzione standard di Invio in Normal Mode per evitare conflitti
-- vim.keymap.set('n', '<CR>', '<Nop>', { silent = true })

map('n', '<BackSpace>', '<PageUp>')
map('n', '<Space>', '<PageDown>')
map('n', '<C-o>', ':tabe ')
map('n', '<C-h>', ':noh<CR>')
map('n', '<tab>', ':tabnext<cr>')
map('n', '<s-tab>', ':tabprevious<cr>')
map('n', '<C-t>', ':noexpandtab<cr>')
map('n', '<s-t>', ':expandtab<cr>')
map('n', '<C-p>', ':Pdb<cr>')

map('n', 'gd', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { desc = "Definizione in nuova tab" })

-- COMMENTARE/DECOMMENTARE con Ctrl + c
-- 'gcc' è il comando di default del plugin per commentare una riga
map('n', '<C-c>', 'gcc', { remap = true, desc = "Commenta riga" })
map('v', '<C-c>', 'gc', { remap = true, desc = "Commenta selezione" })

-- Muove il cursore su e giù con la rotella
vim.keymap.set('n', '<ScrollWheelUp>', 'k', { silent = true })
vim.keymap.set('n', '<ScrollWheelDown>', 'j', { silent = true })
vim.keymap.set('i', '<ScrollWheelUp>', '<Up>', { silent = true })
vim.keymap.set('i', '<ScrollWheelDown>', '<Down>', { silent = true })
vim.keymap.set('v', '<ScrollWheelUp>', 'k', { silent = true })
vim.keymap.set('v', '<ScrollWheelDown>', 'j', { silent = true })
-- copy by select as usually work on linux
vim.keymap.set('v', '<LeftRelease>', '"*ygv', { silent = true })
vim.keymap.set('v', '<2-LeftRelease>', '"*ygv', { silent = true })

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>ss', '<cmd>Telescope grep_string<cr>')
map('n', '<leader>gg', '<cmd>Telescope live_grep<cr>')
