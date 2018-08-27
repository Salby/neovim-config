call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim'

Plug 'pangloss/vim-javascript'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'steelsojka/deoplete-flow'

Plug 'jiangmiao/auto-pairs'

call plug#end()

" General stuff.
filetype plugin indent on

" File-type-specific indentation and stuff.
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Theme stuff.
set background=dark

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:material_theme_style = 'default'

let g:material_terminal_italics = 1

colorscheme material


" Javascript syntax highlighting.
let g:javascript_plugin_jsdoc = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use deoplete-flow.
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif
