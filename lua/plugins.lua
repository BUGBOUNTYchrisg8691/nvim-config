-- loaded using `lua require 'plugins'` in nightly.vim

-- used because packer is in `opt` pack in VIMRUNTIM
vim.cmd [[packadd packer.nvim]]

-- Only if your version of Neovim doesn't have pull 12632 merged
--vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  
  -- VimPeccable (allow vimrc to be written in lua)
  use {'svermeulen/vimpeccable'}
  
  -- Gruvbox Colorscheme
  use {'morhetz/gruvbox'}

  -- Searching
  use {'ctrlpvim/ctrlp.vim'}
  --use {'junegunn/fzf'}
  use {'junegunn/fzf.vim'}

  -- NERD
  -- Commenter
  use {'preservim/nerdcommenter'}
  -- File Tree
  use {'preservim/nerdtree', {'Xuyuanp/nerdtree-git-plugin', {'ryanoasis/vim-devicons'}}}

  -- TPope
  -- Surround
  use {'tpope/vim-surround'}
  -- Repeat
  use {'tpope/vim-repeat'}
  -- Git Integration
  use {'tpope/vim-fugitive'}

  -- Statusline
  use {'vim-airline/vim-airline', {'vim-airline/vim-airline-themes'}}
  
  -- IDE-like Plugs like autocompletion
  -- autocomplete brackets, parentheses, and quotes
  use {'jiangmiao/auto-pairs'}
  -- Multiple Cursors
  use {'terryma/vim-multiple-cursors'}
  -- Git Integration
  use {'airblade/vim-gitgutter'}
  -- Class suggestions
  use {'majutsushi/tagbar'}
  -- CoC
  use {'neoclide/coc.nvim'}
  -- React plugins
  use {'MaxMEllon/vim-jsx-pretty'}
  use {'pangloss/vim-javascript'}

  -- Language Specific Plugs
  -- Lua
  use {'tbastos/vim-lua'}
  -- Java
  use {'artur-shaik/vim-javacomplete2'}
  use {'uiiaoo/java-syntax.vim'}
  -- Python
  use {'davidhalter/jedi-vim'}
  -- Fish
  use {'dag/vim-fish'}

	
end)

