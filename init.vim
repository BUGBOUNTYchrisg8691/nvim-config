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
set noshowmode

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
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'

" IDE-like Plugs (Completion)
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'

" Language Specific Completion Plugs
" Java
Plug 'artur-shaik/vim-javacomplete2'
" Python
Plug 'davidhalter/jedi-vim'

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
let g:airline_powerline_fonts = 1
" Airline integration with YCM
let g:airline#extensions#ycm#enabled = 1
" Airline integration with Ale
let g:airline#extensions#ale#enabled = 1

" Statusline
set laststatus=2
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set statusline+=%{FugitiveStatusline()}

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

" Use RipGrep with CtrlP
function! CtrlPCommand()
  let c = 0
  let wincount = winnr('$')
  " Don't open it here if current buffer is not writable (e.g. NERDTree)
  while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
    exec 'wincmd w'
    let c = c + 1
  endwhile
  exec 'CtrlP'
endfunction
let g:ctrlp_cmd = 'call CtrlPCommand()'

" RipGrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
      \ 'dir':  '',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.meta|\.zip|\.rar|\.ipa|\.apk',
      \ }

" fzf Settings
" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Nerd Tree Settings/Bindings
nnoremap <silent><leader>nf :NERDTreeFocus<CR>
nnoremap <silent><leader>nt :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Change default arrows
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" Helper Functions
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

" LSP-Support for YCM
source /home/chrisg/.config/nvim/lsps/vimrc.generated

" JavaComplete2 Settings
" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" Disable auto add closing brace (conflicts w auto-pairs)
let g:JavaComplete_ClosingBrace = 0

" Sort completion result automatically
let g:JavaComplete_CompletionResultSort = 0

" F4 To enable smart (trying to guess import option) inserting class imports
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" F5 To enable usual (will ask for import option) inserting class import
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" F6 To add all missing imports
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" F7 Remove unused imports
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" Default Mappings
nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" ALE Settings
" auto importing
let g:ale_completion_autoimport = 1

" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0

" List height
let g:ale_list_window_size = 5

" Setup compilers for languages
let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac'],
      \  'javascript': ['eslint'],
      \  'typescript': ['tslint']
      \ }

" Generate help docs for ale
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" UltiSnips Settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" Since we are already using YCM, and using tab with both doesn't work nice use <c-j> instead
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

" TagBar Settings/Bindings
" Ctrl-b to open Tagbar
map <leader>tt :TagbarToggle<CR>
