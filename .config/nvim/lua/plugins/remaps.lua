local km = vim.keymap

-- cmp
local cmp = function()
  local cmp        = require('cmp')
  local cmp_select = { behavior = cmp.SelectBehavior.Select }
  return {
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  }
end

-- lsp
local lsp = function(bufnr)
  local opts = { buffer = bufnr, remap = false }
  local buf = vim.lsp.buf

  km.set("n", "gd",           function() buf.definition()             end, opts)
  km.set("n", "K",            function() buf.hover()                  end, opts)
  km.set("n", "<leader>vws",  function() buf.workspace_symbol()       end, opts)
  km.set("n", "<leader>vd",   function() vim.diagnostic.open_float()  end, opts)
  km.set("n", "[d",           function() vim.diagnostic.goto_next()   end, opts)
  km.set("n", "]d",           function() vim.diagnostic.goto_prev()   end, opts)
  km.set("n", "<leader>vca",  function() buf.code_action()            end, opts)
  km.set("n", "<leader>vrr",  function() buf.references()             end, opts)
  km.set("n", "<leader>vrn",  function() buf.rename()                 end, opts)
  km.set("i", "<C-h>",        function() buf.signature_help()         end, opts)
  km.set("n", "<leader>f",    function() vim.lsp.buf.format()         end, opts)
end

-- telescope
local telescope = function()
  local actions = require("telescope.actions")

  -- general
  km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
  km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
  km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
  km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
  km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

  -- git commands
  km.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
  km.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
  km.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
  km.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

  return {
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
  }
end

-- nvim-tree 
km.set("n", "<leader>e", ":NvimTreeFocus<CR>") -- focus file explorer
km.set("n", "<leader>E", ":NvimTreeToggle<CR>") -- toggle file explorer

-- undotree
km.set("n", "<leader>u", function()
  vim.cmd.UndotreeToggle() -- toggle undo tree
  vim.cmd.UndotreeFocus()
end)

return {
  cmp       = cmp,
  lsp       = lsp,
  telescope = telescope,
}
