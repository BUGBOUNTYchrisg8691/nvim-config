-- Lua Neovim Configuration
--local vim = require('vim')

-- Visual Settings
vim.cmd('colorscheme gruvbox')
vim.g.termguicolors = true
vim.w.colorcolumn = '80'
vim.cmd('hi ColorColumn guibg=#7c6f64')

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
--vim.cmd('let statusline+=%{FugitiveStatusline()}')
--vim.cmd('let g:airline#extensions#ale#enabled = 1')


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
vim.g.writebackup = false
vim.g.noswap = 1
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

-- Util Plug Settings
-- CtrlP Settings
-- map command to Ctrl-P keybind
vim.cmd('let g:ctrlp_map = "<c-p>"')
vim.cmd('let g:crtlp_cmd = "CtrlP"')
-- Set where CtrlP looks for the root directory when searching
vim.cmd('let g:ctrlp_working_mode = "ra"')
vim.cmd('let g:ctrlp_root_markers = ["pom.xml", ".git", "package.json"]')
-- Ignore files in `.gitignore`
vim.cmd('let g:ctrlp_user_command = [".git", "cd %s && git ls-files -co -exclude-standard"]')
-- Exclude files using Vim's builtin `wildignore` setting
vim.cmd('set wildignore+=*/tmp/*,*.so,*.swp,*.zip')
vim.cmd('let g:ctrlp_custom_ignore = "\\v[\\/]\\.(git|hg|svn)$"')
vim.cmd('let g:ctrlp_custom_ignore = {"dir": "\\v[\\/]\\.(git|hg|svn)$", "file": "\\v\\.(exe|so|dll)$", "link": "some_bad_symbolic_links"}')

-- Use RipGrep with CtrlP
local coms = require 'coms'

-- fzf Settings






