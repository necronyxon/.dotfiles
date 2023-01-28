local settings  = require("plugins.settings")
local telescope = require("telescope")

require("plugins.packer")
require("plugins.lsp")

require("impatient")
require("Comment")                .setup()
require("gitsigns")               .setup()
require("nvim-surround")          .setup()
require("dracula")                .setup(settings.dracula)
require("gruvbox")                .setup(settings.gruvbox)
require("lualine")                .setup(settings.lualine)
require("nvim-tree")              .setup(settings.nvim_tree)
require("nvim-treesitter.configs").setup(settings.treesitter)

telescope                         .setup(settings.telescope)
telescope                         .load_extension("fzf")

vim.cmd([[ colorscheme gruvbox ]])
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#FFFFFF ]])
