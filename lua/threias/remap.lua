--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', '<C-v>', '<Nop>')

-- Switch between wrap and nowrap
vim.keymap.set('n', '<leader>w', function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, { noremap = true })

-- Move lines up/down in Visual Mode
vim.keymap.set('v', '<S-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-j>', ":m '>+1<CR>gv=gv")

-- Move lines left/right in Visual Mode
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
--vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
--vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Go back to tree
vim.keymap.set('n', '<leader>eq', vim.cmd.Ex, { desc = 'Execute :Ex command' })

-- Rename var in same file
vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Rename var in same file' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<Nop>')
vim.keymap.set('n', '<right>', '<Nop>')
vim.keymap.set('n', '<up>', '<Nop>')
vim.keymap.set('n', '<down>', '<Nop>')
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
