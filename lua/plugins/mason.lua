return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            -- Konfigurationsoptionen hier einstellen
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end,
}

