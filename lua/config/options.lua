vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Carattere che appare accanto all'errore
    spacing = 12,
  },
  signs = true,          -- Mostra icone nella colonna laterale (sign column)
  underline = true,      -- Sottolinea il codice errato
  update_in_insert = false, -- Non tormentarti mentre scrivi, aspetta che esci dalla modalità Insert
  severity_sort = true,  -- Ordina per importanza (Errori prima dei Warning)
  float = {
    focused = false,
    style = 'minimal',
    border = 'rounded',  -- Bordi arrotondati per il popup degli errori
    source = 'always',   -- Mostra da quale LSP arriva l'errore (es. pyright, sqls)
    header = '',
    prefix = '',
  },
})
vim.opt.mouse = 'a'
vim.opt.mousescroll = "ver:1,hor:6"
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.numberwidth = 2
vim.opt.laststatus = 2
vim.opt.encoding = "utf-8"
vim.opt.guicursor = "i:block"
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_user_command('Pdb', 'normal! i import pdb; pdb.set_trace()\27', {})

-- AUTOCOMMANDS (Ricorda posizione)
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})
