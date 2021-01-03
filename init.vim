" init.vim

let $NVIM_CONFIG_DIR = expand('$HOME/.config/nvim')

if has('nvim-0.5')
  " Nightly config
  source $NVIM_CONFIG_DIR/nightly.vim
else
  " Stable config
  source $NVIM_CONFIG_DIR/stable.vim
endif
