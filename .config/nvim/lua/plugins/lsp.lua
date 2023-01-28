local remaps = require("plugins.remaps")
local lsp    = require("lsp-zero")

vim.diagnostic.config({ virtual_text = true })

-- preferences
lsp.preset          ("recommended")
lsp.set_preferences ({
  suggest_lsp_servers = false,
  sign_icons = { error = 'E', warn = 'W', hint = 'H', info = 'I' }
})

-- lsp specific configurations
lsp.ensure_installed({ 'tsserver', 'sumneko_lua' })
lsp.configure       ('sumneko_lua',
  { settings = { Lua = { diagnostics = { globals = { 'vim' }}}}}
)

-- remaps
lsp.setup_nvim_cmp  ({ mapping = lsp.defaults.cmp_mappings(remaps.cmp()) })
lsp.on_attach       (function(_, bufnr) remaps.lsp(bufnr) end)

lsp.setup()
