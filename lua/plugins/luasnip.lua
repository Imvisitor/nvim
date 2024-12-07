return {
  'L3MON4D3/LuaSnip',   -- Pfad zum LuaSnip Repository
  requires = 'rafamadriz/friendly-snippets',  -- Eine Sammlung von Snippets für viele Programmiersprachen
  config = function()
    local luasnip = require('luasnip')
    
    -- Standardkonfigurationen für LuaSnip
    luasnip.config.set_config({
      history = true,             -- Ermöglicht das Navigieren durch Snippet-Vorgänger und -Nachfolger
      updateevents = 'TextChanged,TextChangedI',  -- Update Snippets bei Textänderungen
    })

    -- Lade die Snippets aus dem friendly-snippets Paket
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Erweiterungen für mehr Funktionalität
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })  -- Pfad zu deinen persönlichen Snippets

    -- Erstelle eigene Snippets (Beispiel)
    luasnip.snippets = {
      lua = {  -- Snippets speziell für Lua
        luasnip.parser.parse_snippet("fn", "function($1) $0 end"),  -- `fn` ist das Triggerwort
      },
      python = {
        luasnip.parser.parse_snippet("def", "def $1($2):\n    $0"),  -- Python-Funktionssnippet
      },
    }
    
    -- Optional: Tastenkombinationen für die Navigation durch Snippets (innerhalb eines Insert-Mode Mappings)
    vim.api.nvim_set_keymap("i", "<Tab>", [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']], { silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", [[luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>']], { silent = true, expr = true })
  end
}

