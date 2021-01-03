-- Keybindings

--local vim = require('vim')
-- quick source and edit configuration files
vim.api.nvim_set_keymap('n', '<c-h>r', ':source $HOME/.config/nvim/init.vim<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-h>b', ':edit $HOME/.config/nvim/lua/binds.lua<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-h>c', ':edit $HOME/.config/nvim/lua/config.lua<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<c-h>p',
  ':edit $HOME/.config/nvim/lua/plugins.lua<cr>',
  { noremap = true, silent = true }
)

-- Navigation/Window Management
-- Window/Buffer movement
-- left split
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = false })
-- right split
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = false })
-- up split
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = false })
-- down split
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = false })

-- Split windows
-- Vertical split
vim.api.nvim_set_keymap('n', '<leader>wv', ':vsp<cr>', { noremap = true, silent = true })
-- Horizontal split
vim.api.nvim_set_keymap('n', '<leader>ws', ':sp<cr>', { noremap = true, silent = true })

-- Resize windows
vim.api.nvim_set_keymap('n', '<leader>wh', ':vertical :resize +5', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', ':vertical :resize -5', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', ':resize +5', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', ':resize -5', { noremap = true, silent = true })

-- Navigate buffers
-- Next
vim.api.nvim_set_keymap('', '<leader>bn', ':bnext<cr>', { noremap = false, silent = true })
-- Previous
vim.api.nvim_set_keymap('', '<leader>bp', ':bprevious<cr>', { noremap = false, silent = true })
-- Close current Buffer
vim.api.nvim_set_keymap('', '<leader>bc', ':Bclose<cr>:tabclose<cr>gT', { noremap = false, silent = true })
-- Close all buffers
vim.api.nvim_set_keymap('', '<leader>ba', ':bufdo bd<cr>', { noremap = false, silent = true })

-- Tab Mappings
-- New
vim.api.nvim_set_keymap('', '<leader>ta', ':tabnew<cr>', { noremap = false, silent = true })
-- Close all other tabs
vim.api.nvim_set_keymap('', '<leader>to', ':tabonly<cr>', { noremap = false, silent = true })
-- Close Tab
vim.api.nvim_set_keymap('', '<leader>tc', ':tabclose<cr>', { noremap = false, silent = true })
-- Move Tab left 1
vim.api.nvim_set_keymap('', '<leader>th', ':-tabmove<cr>', { noremap = false, silent = true })
-- Move Tab right 1
vim.api.nvim_set_keymap('', '<leader>tl', ':+tabmove<cr>', { noremap = false, silent = true })
-- Go to next tab
vim.api.nvim_set_keymap('', '<leader>t<tab>', ':tabnext<cr>', { noremap = false, silent = true })
-- Let `Leader tl` toggle between this and the last accessed tab
--vim.g.lasttab = 1
--vim.api.nvim_set_keymap('n', '<leader>lt', ':exe "tabn ".g:lasttab<cr>', { noremap = false, silent = true })
--vim.cmd('autocmd TabLeave * let g:lasttab=tabpagenr()')

-- Open a Zsh terminal in `insert` mode
vim.api.nvim_set_keymap(
  'n',
  '<leader>oz',
  ':sp term://zsh <bar> :resize 10<cr><bar>a',
  { noremap = true, silent = true }
)

-- Open a Fish terminal in `insert` mode
vim.api.nvim_set_keymap(
  'n',
  '<leader>of',
  ':sp term://fish <bar> :resize 10<cr><bar>a',
  { noremap = true, silent = true }
)





