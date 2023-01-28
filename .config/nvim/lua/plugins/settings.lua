local remaps = require("plugins.remaps")

-- nvim-treesitter
local treesitter = {
  ensure_installed = { "help", "javascript", "typescript", "vim" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- lualine
local lualine = {
  options = {
    icons_enabled = false,
    component_separators = '|',
    section_separators = ''
  },
  extensions = { 'nvim-tree' }
}

-- nvim-tree
local nvim_tree = {
  renderer = {
    icons = {
      show = { file = false, folder = false },
      glyphs = { folder = { arrow_closed = "", arrow_open = "", }, },
    },
  }, actions = { open_file = { window_picker = { enable = false, }, }, },
  -- git = { ignore = false, },
}

-- telescope
local telescope = {
  defaults = {
    mappings = {
      i = remaps.telescope(),
    },
  },
}

-- dracula
local dracula = {
  transparent_bg = false,
  italic_comment = true,
  show_end_of_buffer = true,
}

-- gruvbox
local gruvbox = {
  transparent_mode = false,
  bold = false,
  contrast = "hard", -- can be "hard", "soft" or empty string
}

return {
  lualine    = lualine,
  dracula    = dracula,
  gruvbox    = gruvbox,
  nvim_tree  = nvim_tree,
  telescope  = telescope,
  treesitter = treesitter,
}
