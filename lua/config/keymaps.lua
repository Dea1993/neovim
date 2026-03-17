-- Imposta INVIO come leader
vim.g.mapleader = "\13"
vim.g.maplocalleader = "\13"

-- Disabilita la funzione standard di Invio in Normal Mode per evitare conflitti
-- vim.keymap.set('n', '<CR>', '<Nop>', { silent = true })

vim.keymap.set('n', '<BackSpace>', '<PageUp>')
vim.keymap.set('n', '<Space>', '<PageDown>')
vim.keymap.set('n', '<C-o>', ':tabe ')
vim.keymap.set('n', '<C-h>', ':noh<CR>')
vim.keymap.set('n', '<tab>', ':tabnext<cr>')
vim.keymap.set('n', '<s-tab>', ':tabprevious<cr>')
vim.keymap.set('n', '<C-t>', ':noexpandtab<cr>')
vim.keymap.set('n', '<s-t>', ':expandtab<cr>')
vim.keymap.set('n', '<C-p>', ':Pdb<cr>')

vim.keymap.set('n', 'gd', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { desc = "Definizione in nuova tab" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = '[G]oto [R]eferences' })

-- COMMENTARE/DECOMMENTARE con Ctrl + c
-- 'gcc' è il comando di default del plugin per commentare una riga
vim.keymap.set('n', '<C-c>', 'gcc', { remap = true, desc = "Commenta riga" })
vim.keymap.set('v', '<C-c>', 'gc', { remap = true, desc = "Commenta selezione" })

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

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>Telescope live_grep<cr>')
