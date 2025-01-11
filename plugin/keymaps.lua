local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- navigating panes
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper window" })

-- indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- save file
set("n", "<leader><space>", ":w<CR>", opts)
set("n", "<leader>q", ":q<CR>", opts)

-- buffer navigation
set("n", "<leader>h", ":bn<CR>", { desc = "Move to next buffer" })
set("n", "<leader>l", ":bp<CR>", { desc = "Move to previous buffer" })

-- Move Lines
set("n", "∆", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
set("n", "˚", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
set("v", "∆", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
set("v", "˚", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- nvimtree
set("n", "<leader>t", ":NvimTreeToggle<CR>", opts)


-- lspsaga 
set('n', '<leader>j', ":Lspsaga diagnostic_jump_next<cr>")
set('n', '<leader>k', ":Lspsaga diagnostic_jump_prev<cr>")
