return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup({
            auto_load = true,         -- whether to automatically load preview when                -- entering another markdown buffer
            close_on_bdelete = true,  -- close preview window on buffer delete
            syntax = true,            -- enable syntax highlighting, affects performance
            theme = 'dark',           -- 'dark' or 'light'
            update_on_change = true,
            app = 'webview',          -- 'webview', 'browser', string or a table of strings
            filetype = { 'markdown' },-- list of filetypes to recognize as markdown
            throttle_at = 200000,     -- start throttling when file exceeds this
            throttle_time = 'auto',
        })
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
}
