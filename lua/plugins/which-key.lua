return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Lädt das Plugin nur bei Bedarf
  config = function()
    require("which-key").setup({
      -- Hier kannst du Optionen konfigurieren
      plugins = {
        spelling = { enabled = true }, -- Aktiviert Vorschläge für Rechtschreibung
      },
      win = {
        border = "rounded", -- Abgerundete Fensterrahmen
      },
    })
  end,
}
