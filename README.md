## 🛠️ Dipendenze di Sistema

Per far funzionare correttamente i plugin (Mason, Telescope, Treesitter), installa i seguenti pacchetti tramite `pacman`:

    sudo pacman -S git nodejs npm ripgrep fd base-devel unzip python-pip

- npm/nodejs: Necessario per server LSP come vtsls e pyright.
- ripgrep/fd: Rendono Telescope istantaneo nella ricerca file.
- base-devel: Necessario per compilare l'estensione FZF nativa.
- unzip: Usato da Mason per estrarre i pacchetti scaricati.

📂 Struttura della Configurazione
Plaintext

    .
    ├── init.lua              # Entry point (Leader e require principali)
    ├── lua/
    │   ├── config/
    │   │   ├── lazy.lua      # Bootstrapping del plugin manager
    │   │   ├── keymaps.lua   # Tutti i miei shortcut personalizzati
    │   │   └── options.lua   # Settaggi di Neovim (indentazione, mouse, etc.)
    │   └── plugins/
    │       └── init.lua      # Lista plugin e configurazioni LSP/UI
    └── README.md

Ecco una tabella dei comandi pulita e organizzata, pronta per essere incollata nel tuo README.md. Ho diviso i comandi per categorie (Navigazione, Editing, LSP e Telescope) così è molto più facile da consultare quando sei sulla Steam Deck.
Markdown

## ⌨️ Comandi Personalizzati (Keybindings)

Il tasto **Leader** e il **LocalLeader** sono impostati su `<CR>` (Invio).

### 📂 Navigazione e Tab
| Tasto | Azione | Descrizione |
| :--- | :--- | :--- |
| `<Tab>` | Prossima Tab | Passa alla scheda successiva |
| `<S-Tab>` | Tab Precedente | Torna alla scheda precedente |
| `<C-o>` | Nuova Tab | Apre una tab vuota (`:tabe`) |
| `<Space>` | Page Down | Scorri pagina giù (in Normal mode) |
| `<BackSpace>` | Page Up | Scorri pagina su (in Normal mode) |

### 📝 Editing e Utility
| Tasto | Azione | Descrizione |
| :--- | :--- | :--- |
| `<C-c>` | Commenta | Commenta/Decommenta riga o selezione |
| `<C-h>` | No Highlight | Pulisce i risultati della ricerca (`:noh`) |
| `<C-t>` | No Expand Tab | Usa i tabulatori reali |
| `<S-t>` | Expand Tab | Converte i tab in spazi |
| `:Pdb` | Debug Python | Inserisce al volo un breakpoint PDB |
| `Scroll 🖱️` | Move Cursor | La rotella muove il cursore `j`/`k` (anche in Insert) |

### 🔍 Telescope (Fuzzy Finder)
| Tasto | Azione | Descrizione |
| :--- | :--- | :--- |
| `<Leader>ff` | Trova File | Cerca file per nome nel progetto |
| `<Leader>gg` | Live Grep | Cerca una stringa dentro tutti i file |
| `<Leader>ss` | Grep String | Cerca la parola sotto il cursore |

### 🤖 LSP e Programmazione
| Tasto | Azione | Descrizione |
| :--- | :--- | :--- |
| `gd` | Go to Definition | Definizione in una **nuova tab** |
| `K` | Hover | Mostra documentazione/tipo sotto il cursore |
| `Tab` (menu) | Next Item | Naviga tra i suggerimenti dell'autocompletamento |
| `Enter` | Confirm | Conferma il suggerimento selezionato |

# 🖱️ Mouse e Navigazione

    Rotella del Mouse: Muove fisicamente il cursore j/k (anche in modalità Insert!).

    Auto-remember: All'apertura di un file, Neovim torna automaticamente all'ultima posizione del cursore.

# 🚀 Plugin Installati

    Lazy.nvim: Gestore plugin ultra-veloce.

    Mason: Per l'installazione automatica di pyright, bashls, vtsls, stylua, shellcheck.

    LSPConfig: Integrazione nativa per l'autocompletamento intelligente.

    Kanagawa: Il tema principale (ispirato all'arte giapponese).

    Lualine: Barra di stato elegante con icone e diagnostica.

    Noice & Notify: Sistema di notifiche moderno e compatto.

# 🔌 Setup Rapido (Installazione)

Clona la repo nella tua cartella config:
Bash

    git clone git@github.com:Dea1993/neovim.git ~/.config/nvim

Avvia Neovim:
Bash

    nvim

Attendi che Lazy scarichi i plugin e Mason installi i server LSP. Riavvia se necessario.
