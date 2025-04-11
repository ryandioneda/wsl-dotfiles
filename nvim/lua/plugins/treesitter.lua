
local config = require("nvim-treesitter.configs")

config.setup({
    --parsers--
    ensure_installed = {"lua", "javascript"},
    highlight = { enable = true },
    indent = { enable = true }
})
