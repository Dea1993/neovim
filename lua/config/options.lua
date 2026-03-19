vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Carattere che appare accanto all'errore
    spacing = 8,
  },
  signs = true,          -- Mostra icone nella colonna laterale (sign column)
  underline = true,      -- Sottolinea il codice errato
  update_in_insert = false, -- Non tormentarti mentre scrivi, aspetta che esci dalla modalità Insert
  severity_sort = true,  -- Ordina per importanza (Errori prima dei Warning)
  float = {
    focused = false,
    style = 'minimal',
    border = 'rounded',  -- Bordi arrotondati per il popup degli errori
    source = true,   -- Mostra da quale LSP arriva l'errore (es. pyright, sqls)
    header = '',
    prefix = '',
  },
})

-- vim.opt.mouse = 'a'
vim.opt.mouse = "" -- totally disable mouse, to let terminal-emulator control it
vim.opt.mousescroll = "ver:1,hor:6"
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.numberwidth = 2
vim.opt.laststatus = 2
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"

-- define cursor type during:
-- [n]normal/[v]visual/[c]command/[sm]show-match: block
-- [i]insert/[ci]command-line-insert/[ve]visual-exclusive: vertical line
-- [r]replace/[cr]command-line-replace/[o]operator-pending
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver20,r-cr-o:hor20"

vim.api.nvim_create_user_command('Pdb', 'normal! iimport pdb; pdb.set_trace()\27', {})
-- AUTOCOMMANDS (Ricorda posizione)
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})
