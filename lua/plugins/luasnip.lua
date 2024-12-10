return {
  'L3MON4D3/LuaSnip',
  requires = 'rafamadriz/friendly-snippets',
  config = function()
    local luasnip = require('luasnip')
    luasnip.config.set_config({
      history = true,
      updateevents = 'TextChanged,TextChangedI',
    })

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })

    luasnip.snippets = {
      lua = {
        luasnip.parser.parse_snippet("fn", "function($1) $0 end"),
      },
      python = {
        luasnip.parser.parse_snippet("def", "def $1($2):\n    $0"),
      },
      c = {
        luasnip.parser.parse_snippet("main", "#include <stdio.h>\n\nint main(int argc, char *argv[]) {\n    $0\n    return 0;\n}"),
      },
      java = {
        luasnip.parser.parse_snippet("main", "public static void main(String[] args) {\n    $0\n}"),
      },
    }

    vim.api.nvim_set_keymap("i", "<Tab>",   [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']],   { silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", [[luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>']],             { silent = true, expr = true })
  end
}
