call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim'

Plug 'pangloss/vim-javascript'

Plug 'jiangmiao/auto-pairs'

Plug 'Valloric/youCompleteMe', { 'do': './install.py --tern-completer' }

call plug#end()

" General stuff.
filetype plugin indent on
set number

" File-type-specific indentation and stuff.
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 tabstop=2

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

" Start autocompletion after4 characters.
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window ( I find it really annoying )
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
