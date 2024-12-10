return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install", -- Installiere die notwendigen Abhängigkeiten
  ft = { "markdown" }, -- Nur für Markdown-Dateien laden
  config = function()
    -- Stelle sicher, dass das Plugin richtig initialisiert ist
    vim.g.mkdp_auto_start = 1       -- Automatische Vorschau starten
    vim.g.mkdp_auto_close = 1       -- Vorschau beim Schließen der Datei beenden
    vim.g.mkdp_refresh_slow = 0     -- Schnelles Aktualisieren
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_open_ip = ""
    vim.g.mkdp_browser = ""         -- Standardsystembrowser verwenden
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = "middle",
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      content_editable = false,
      disable_filename = 0
    }
    vim.g.mkdp_markdown_css = ""
    vim.g.mkdp_highlight_css = ""
    vim.g.mkdp_port = "8088"
    vim.g.mkdp_page_title = "Markdown Preview"
    vim.g.mkdp_filetypes = { "markdown" }

    -- Keymaps für einfache Bedienung
    vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
  end,
}

