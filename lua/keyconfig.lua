vim.keymap.set("n", "<leader>/", "<Cmd>set invhlsearch<CR>", { remap = true, silent = true, desc = "Hide search highlights" })
vim.keymap.set({ "n", "v", "o" }, "<leader>fc", "/\\v^[<\\|=>]{7}( .*\\|$)<CR>", { remap = true, desc = "Find merge conflict martkers" })

-- For when you forget to sudo.. Really Write the file.
vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null", { remap = true })

vim.keymap.set("n", "<c-s>", "<Cmd>w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<c-c>", "<Cmd>q<CR>", { desc = "Quit current window" })
vim.keymap.set("n", "<c-x>c", "<Cmd>bdelete<CR>", { desc = "Unload buffer" })

vim.keymap.set("n", "<leader>nt", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>nf", "<Cmd>Neotree reveal<CR>", { desc = "Reveal current file in Neotree" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- If you visually select something and hit paste
-- that thing gets yanked into your buffer. This
-- generally is annoying when you're copying one item
-- and repeatedly pasting it. This changes the paste
-- command in visual mode so that it doesn't overwrite
-- whatever is in your paste buffer.
vim.keymap.set("v", "p", '"_dP"')

-- The Smash Escape
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>dd", "<Cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>")
vim.keymap.set("n", "<leader>dn", "<Cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<leader>dp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")
