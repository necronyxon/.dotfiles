local km = vim.keymap

vim.g.mapleader = " " -- set leader key to space

-- general
km.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
km.set("n", "<leader>qq", ":qa<CR>") -- quit all

-- center line on big motions
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- delete single character without copying into register
km.set("n", "x", "\"_x")

-- paste without copying the replaced text onto register
km.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
km.set({ "n", "v" }, "<leader>y", [["+y]])
km.set("n", "<leader>Y", [["+Y]])

-- delete without copying into register
km.set({ "n", "v" }, "<leader>d", [["_d]])

-- new lines on normal mode
km.set("n", "<A-j>", "o<ESC>k") -- new line down
km.set("n", "<A-k>", "O<ESC>j") -- new line up

-- reselect last pasted text
km.set("n", "gV", "`[v`]")

-- move blocks of code and indent them
km.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up
km.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down

-- change indentation continuously
km.set("v", "<", "<gv")
km.set("v", ">", ">gv")

-- rename all instances of the string behind the cursor
km.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- run current line through the terminal and print the result
km.set("n", "<leader><CR>", ":.!zsh<CR>")
