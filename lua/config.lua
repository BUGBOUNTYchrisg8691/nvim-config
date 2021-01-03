-- Lua Neovim Configuration
--local vim = require('vim')

vim.cmd('colorscheme gruvbox')

vim.g.encoding = 'utf-8'

vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.g.ffs = 'unix,dos,mac'

vim.g.splitright = true
vim.o.splitright = true
vim.g.splitbelow = true
vim.o.splitbelow = true

vim.g.autoread = true
vim.cmd('au FocusGained,BufEnter * checktime')
vim.g.syntax = 'enable'

-- Statusline - Airline
vim.g.airline_theme = 'wombat'
vim.g.airline_powerline_fonts = 1
vim.cmd('let g:airline#extensions#tabline#left_sep = ">"')
vim.cmd('let g:airline#extensions#tabline#left_alt_sep = "|"')
vim.cmd('let g:airline#extensions#fzf#enabled = 1')
vim.g.laststatus = 2
--vim.cmd("let statusline+=%{FugitiveStatusline()}")

-- code formatting
vim.g.mapleader = " "
vim.b.tabstop = 2
vim.bo.tabstop = 2
vim.b.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.b.expandtab = true
vim.bo.expandtab = true
vim.g.smarttab = true
vim.b.autoindent = true
vim.bo.autoindent = true
vim.b.smartindent = true
vim.bo.smartindent = true
vim.wo.wrap = false

-- handling swap file/backup
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.noswap = true
vim.g.undodir = '$HOME/.config/nvim/undo'
vim.g.undofile = true

-- window styling
vim.g.wildmenu = true
vim.g.cmdheight = 1
vim.w.foldcolumn = 1
vim.g.lazyredraw = true
vim.g.noshowmode = true

vim.wo.number = true
vim.wo.relativenumber = true

-- Searching
vim.o.ignorecase = true
vim.g.smartcase = true
vim.g.incsearch = true
vim.g.hlsearch = true
vim.g.showmatch = true

vim.g.noerrorbells = true
vim.g.novisualbell = true
vim.g.tm = 500

-- FileType autocommands but I couldn't get the ftplugins files to work
vim.cmd('autocmd FileType c,go setlocal shiftwidth=8 tabstop=8 expandtab')
vim.cmd('autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab')
vim.cmd('autocmd FileType java setlocal shiftwidth=4 tabstop=8 softtabstop=4 expandtab')
vim.cmd('autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab')
vim.cmd('autocmd FileType lua setlocal shiftwidth=2 tabstop=8 softtabstop=4 expandtab')

-- Return the the last editing position when opening files
vim.cmd('au BufReadPost * if line("\'\\\"") > 1 && line("\'\\\"") <= line("$") | exe "normal! g\'\\"" | endif')



