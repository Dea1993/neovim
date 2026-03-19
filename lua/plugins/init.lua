return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd("colorscheme kanagawa")
    end
  },
  {
    'numToStr/Comment.nvim',
    opts = {}, -- Questo inizializza il plugin con le impostazioni di default
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- 1. Setup di mason-lspconfig per assicurare l'installazione
      require('mason-lspconfig').setup({
        ensure_installed = {
          "pyright",      -- Python
          "vtsls",        -- JavaScript/TypeScript (più moderno di tsserver)
          "bashls",       -- Bash
          "arduino_language_server",
          "lua_ls",
          'clangd',
          'html',
        },
      })

      -- 2. Nuovo metodo Neovim 0.11+ per configurare i server
      -- Invece di lspconfig.pyright.setup, usiamo vim.lsp.config

      -- Configura Pyright
      vim.lsp.config('pyright', {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { ".git", "pyproject.toml", "setup.py" },
      })

      -- Configura Bash
      vim.lsp.config('bashls', {
        filetypes = { "sh", "bash" },
      })

      -- Arduino
      vim.lsp.config('arduino_language_server', {
        cmd = {
          "arduino-language-server",
          "-cli", "arduino-cli",
          "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
          "-fqbn", "arduino:avr:uno" -- Cambia se usi un'altra scheda
        },
        filetypes = { "arduino" },
      })

      -- Configurazione base per Lua
      vim.lsp.config('lua_ls', {
        filetypes = { "lua" },
      })

      -- Configurazione base per Lua
      vim.lsp.config('html', {
        filetypes = { "html", "xhtml", "htm" },
      })

      -- Clangd
      vim.lsp.config('clangd', {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h" },
      })

      -- Ricordati di abilitarlo!
      vim.lsp.enable({
        'pyright',
        "vtsls",        -- JavaScript/TypeScript (più moderno di tsserver)
        'bashls',
        'arduino_language_server',
        'clangd',
        'lua_ls',
        'html',
      })

      -- AUTOCOMPLETE with TAB
      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          -- Conferma con Invio
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          -- Gestione del TAB
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Se il menu è aperto, vai al prossimo
            elseif vim.snippet and vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)    -- Se sei in uno snippet, salta al prossimo campo
            else
              fallback()             -- Altrimenti inserisci un Tab normale
            end
          end, { 'i', 's' }),

          -- Gestione di SHIFT+TAB
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.snippet and vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),

        -- Specifica le sorgenti da cui attingere i suggerimenti
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer',
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs() -- Legge da TUTTI i buffer aperti
              end
            }
          },
          { name = 'path' },
        })
      })
    end
  },

  -- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',
    -- CAMBIA QUI: Rimuovi il 'tag' e usa il ramo principale per compatibilità 0.11
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup({
        defaults = {
          -- Questo disabilita l'highlighter di Treesitter nell'anteprima
          -- se continua a darti problemi, finché Telescope non rilascia un fix ufficiale
          preview = {
            treesitter = false,
          },
        },
      })
      require('telescope').load_extension('fzf')
    end
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 4000,
      render = "compact",
      stages = "static",
      max_width = 35,
      max_height = 10,
      icons = {
        ERROR = " ",
        WARN  = " ",
        INFO  = " ",
        DEBUG = " ",
        TRACE = "✎ ",
      },
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },

  -- Blocco NOICE
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Icone per file e branch
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto', -- Si adatta al tuo colorscheme attuale
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = { 'NvimTree', 'lazy' }, -- Pulizia nelle finestre speciali
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 
            'branch', 
            'diff', 
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = {
                error = ' ', -- Cerchio con X
                warn  = ' ', -- Triangolo esclamativo
                info  = ' ', -- Cerchio con 'i'
                hint  = '󰌵 ', -- La tua lampadina
              }
            }
          },
          lualine_c = { { 'filename', path = 1 } }, -- Mostra il percorso del file
          lualine_x = { 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'pyright',     -- LSP per Python
          'lua-language-server',
          'stylua',      -- Formatter per Lua
          'shellcheck',  -- Per i tuoi script sul Raspberry
        },
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = true, -- Opzionale: mostra chi ha scritto la riga corrente
    },
  },

  {
    "tpope/vim-fugitive",
  },
  "hrsh7th/nvim-cmp",         -- Il motore
  "hrsh7th/cmp-nvim-lsp",     -- Suggerimenti da LSP (fondamentale per Pyright, SQLS, ecc.)
  "hrsh7th/cmp-buffer",       -- Suggerimenti da parole nel file corrente
  "hrsh7th/cmp-path",         -- Suggerimenti per percorsi di file
}
