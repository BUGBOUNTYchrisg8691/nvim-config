set encoding=utf-8

set syntax

filetype plugin on
filetype indent on
set ffs=unix,dos,mac

set splitright
set splitbelow

set autoread
au FocusGained,BufEnter * checktime

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

set nobackup
set nowritebackup
set noswapfile
set undodir=$HOME/.config/nvim/undo
set undofile

set wildmenu
set cmdheight=1
set foldcolumn=1
set lazyredraw

set number relativenumber
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set mat=2

set noerrorbells
set novisualbell
set tm=500

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

syntax enable

call plug#begin('~/.config/nvim/plugs')

" Style Plugs
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Util Plugs
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" IDE-like Plugs
Plug 'jiangmiao/auto-pairs'

call plug#end()

let mapleader = " "

" Quick source init.vim
nnoremap <c-h>r :source ~/.config/nvim/init.vim<cr>

" Navigation/Window Management Keybindings
" Window movement
nnoremap <c-h> <c-w>h 
nnoremap <c-j> <c-w>j 
nnoremap <c-k> <c-w>k 
nnoremap <c-l> <c-w>l 

" Close current buffer
map <leader>bc :Bclose<cr>:tabclose<cr>gT

" Close all buffers
map <leader>ba :bufdo bd<cr>

map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Tabs mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<tab> :tabnext

" Let `tl` toggle between this and the last accessed tab
let g:lasttab=1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab=tabpagenr()

" Return the the last editing position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Terminal Mode Settings
" Escape exits `INSERT` mode in Terminal
tnoremap <esc> <c-\><c-n>
" Open a new terminal window
nnoremap <silent><c-o>t :vsp term://tmux <bar> :vertical resize 40<cr>

" Style Settings
set termguicolors

if $COLORTERM == 'truecolor'
  set t_Co=256
endif

try
  colorscheme gruvbox
catch
endtry

" Airline Settings
let g:airline_theme = "molokai"
let g:ariline#extensions#tabline#left_sep = '>'
let g:ariline#extensions#tabline#left_alt_sep = '|'

" Statusline
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Util Plug Settings
" CtrlP Settings
" map command to Ctrl-P keybind
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Set where CtrlP looks for the root directory when searching
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.git', 'package.json']
" Ignore files in `.gitignore` file
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Exclude files using Vim's builtin `wildignore` setting
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" fzf Settings
" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Delete trailing whitespace on save
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has('autocmd')
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.java :call CleanExtraSpaces()
endif

" Returns true is paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE '
  endif
  return ''
endfunction

" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternativeBufNum = bufnr("#")

  if buflisted(l:alternativeBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":", a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:patter = substitute(l:pattern, "\n$", "", "")

  if a:direction = 'gv'
    call CmdLine("Ack '" . l:pattern . "' ")
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
